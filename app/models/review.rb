class Review < ApplicationRecord
  belongs_to :user
  belongs_to :message_board

  validates :feedback, presence: true, length: { maximum: 500 }
end
