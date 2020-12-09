class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :twitch_id
      t.string :twitch_name

      t.timestamp :bot_added_on
      
      t.timestamps
    end
  end
end
