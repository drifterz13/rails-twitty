class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates_presence_of :body, on: :create, message: "can't be blank"
end
