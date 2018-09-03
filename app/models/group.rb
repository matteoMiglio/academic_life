class Group < ApplicationRecord
  belongs_to :message_board
  has_many :event
  has_many :join
  has_many :user, :through => :join

  # Validations
  validates :name, :state, :message_board, presence: true
  validates :name, length: {maximum: 100, too_long: "Nome troppo lungo!"}
  validates :state, length: {maximum: 10}, inclusion: { in [public, private] }
end
