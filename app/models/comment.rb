class Comment < ActiveRecord::Base

  has_many :notifications, dependent: :destroy
  
  belongs_to :user
  belongs_to :topic
end
