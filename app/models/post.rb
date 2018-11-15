class Post < ApplicationRecord
  belongs_to :user
  belongs_to :message_board
  has_many :comments
  has_many :users, :through => :comments
  has_and_belongs_to_many :users

  default_scope -> { order(created_at: :desc) }

  # Validations
  validates :user, presence: true
  validates :message_board, presence: true
  validates :description, presence: true, length: { maximum: 255, too_long: "Post troppo lungo!" }
end
