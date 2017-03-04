class RemovePhotoFromTopics < ActiveRecord::Migration
  def change
    remove_column :topics, :photo, :string
  end
end
