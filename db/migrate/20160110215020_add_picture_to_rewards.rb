class AddPictureToRewards < ActiveRecord::Migration
  def change
    add_attachment :rewards, :picture
  end
end
