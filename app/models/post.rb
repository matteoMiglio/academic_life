class Post < ApplicationRecord
  belongs_to :user
  belongs_to :message_board
  has_many :comment
  has_many :user, :through => :comment
  has_many :approval
  has_many :user, :through => :approval

  # Validations
  validates :user, :message_board, :description, presence: true
  validates :description, length: { maximum: 255, too_long: "Post troppo lungo!" }
end
