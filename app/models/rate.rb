class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :message_board

  validates :user, presence: true
  validates :message_board, presence: true
  validates :grade, presence: true, numericality: { only_integer: true }
end
