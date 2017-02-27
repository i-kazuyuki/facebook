class Relationship < ActiveRecord::Base

  # Relationshipモデルから見たUserモデルの参照関係を定義
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
end
