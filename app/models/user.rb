require 'open-uri'

class User < ApplicationRecord
  has_one_attached :profile_image

  after_save_commit :broadcast_changes
  before_create :update_from_twitch, unless: :twitch_id
  after_create :send_to_mailchimp

  def send_to_mailchimp
    md5 = Digest::MD5.hexdigest email
    GIBBON.lists(ENV['MAILCHIMP_LIST_ID']).members(md5).upsert(body: {email_address: email, status: "subscribed", merge_fields: {FNAME: twitch_name}})
  end

  def broadcast_changes
    UsersChannel.broadcast_to(self, update: to_prop(true) )
  end

  def self.from_twitch auth_hash
    user = User.where(twitch_id: auth_hash[:uid]).first_or_initialize
    
    if auth_hash['info']['image']
      image = open auth_hash['info']['image']
      user.profile_image.attach(io: image, filename: "avatar.jpg")
    end
    
    user.update!(
      twitch_name: auth_hash['info']['name'],
      email: auth_hash['info']['email']
    )
    user
  end

  def self.from_twitch_name name
    where(twitch_name: name).first_or_create
  end

  def update_from_twitch
    data = TWITCH_CLIENT.get_users(login: name.downcase).data.first
    self.twitch_id = data.id
    self.twitch_name = data.display_name
    if data.profile_image_url
      image = open data.profile_image_url
      self.profile_image.attach(io: image, filename: data.profile_image_url.split('/').last)
    end
  end

  def name
    twitch_name
  end

  def profile_image_thumbnail
    if profile_image.attached?
      Rails.application.routes.url_helpers.rails_representation_url profile_image.variant(resize: '100x100'), only_path: true
    end
  end

  def to_prop(incl_private=false)
    prop = {
      id: id,
      twitch_name: twitch_name,
      profile_image: profile_image_thumbnail,
      url: Rails.application.routes.url_helpers.user_url(self, only_path: true)
    }
  end


end
