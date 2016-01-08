class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, unique: true
      t.integer :role
      t.integer :points
      t.integer :redeemed_points

      t.timestamps null: false
    end
  end
end
