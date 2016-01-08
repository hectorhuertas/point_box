class AddDefaultColumnValuesToUsers < ActiveRecord::Migration
  def change
    change_column :users, :role, :integer, default: 0
    change_column :users, :points, :integer, default: 0
    change_column :users, :redeemed_points, :integer, default: 0
  end
end
