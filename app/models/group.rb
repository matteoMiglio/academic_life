class Group < ApplicationRecord
  belongs_to :message_board
  has_many :events
  has_and_belongs_to_many :users

  # Validations
  validates :name, :state, :message_board, presence: true
  validates :name, length: { maximum: 100, too_long: "Nome troppo lungo!" }
  validates :state, length: { maximum: 10 }, inclusion: { in: %w(public, private) }
end
