class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :message_board

  # Validations
  validates :user, :message_board, :grade, presence: true
  validates :grade, numericality: { only_integer: true }
end
