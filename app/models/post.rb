class Post < ApplicationRecord
  belongs_to :user
  belongs_to :message_board
  has_many :comments
  has_many :users, :through => :comments
  has_and_belongs_to_many :users

  # Validations
  validates :user, :message_board, :description, presence: true
  validates :description, length: { maximum: 255, too_long: "Post troppo lungo!" }
end
