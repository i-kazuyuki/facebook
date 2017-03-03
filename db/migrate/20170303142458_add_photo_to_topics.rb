class AddPhotoToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :photo, :string
  end
end
