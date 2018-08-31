class Post < ApplicationRecord
  belongs_to :user
  belongs_to :message_board
  has_many :comments
  has_many :users, :through => :comments
  has_and_belongs_to_many :users
end
