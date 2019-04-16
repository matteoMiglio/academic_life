class Review < ApplicationRecord
  belongs_to :user
  belongs_to :message_board

  validates :user, presence: true
  validates :message_board, presence: true
  validates :feedback, presence: true, length: { maximum: 500 }
end
