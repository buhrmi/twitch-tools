class CreateInstallations < ActiveRecord::Migration[6.0]
  def change
    create_table :installations do |t|
      t.integer :user_id
      t.string :tool
      t.json :settings

      t.timestamps
    end
  end
end
