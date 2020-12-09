class CreateBids < ActiveRecord::Migration[6.0]
  def change
    create_table :bids do |t|
      t.integer :auction_id
      t.integer :user_id
      t.integer :amount

      t.timestamps
    end
  end
end
