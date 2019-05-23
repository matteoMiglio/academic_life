class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :message_board

  validates :user, presence: true
  validates :message_board, presence: true
  validates :user, uniqueness: { scope: :message_board }
  validates :grade, presence: true, numericality: { only_integer: true, greater_than: 17, less_than: 32 }
end
