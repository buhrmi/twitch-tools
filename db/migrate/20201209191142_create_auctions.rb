class CreateAuctions < ActiveRecord::Migration[6.0]
  def change
    create_table :auctions do |t|
      t.string :name
      t.integer :user_id
      t.timestamp :start_at
      t.timestamp :end_at
      t.integer :start_price
      t.string :currency

      t.timestamps
    end
  end
end
