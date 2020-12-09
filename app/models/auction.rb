class Auction < ApplicationRecord
  has_many :bids
  belongs_to :user

  default_scope lambda { order 'start_at DESC'}

  def self.live_on channel
    includes(:user).where(users: {twitch_name: channel}).first
  end


end
