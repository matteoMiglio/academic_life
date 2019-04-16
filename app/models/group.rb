class Group < ApplicationRecord
  belongs_to :message_board
  has_many :events, dependent: :destroy
  has_and_belongs_to_many :users

  validates :message_board, presence: true
  validates :name, presence: true, length: { maximum: 100, too_long: "Nome troppo lungo!" }
  validates :state, presence: true, length: { maximum: 10 }, inclusion: { in: %w(public, private) }
end
