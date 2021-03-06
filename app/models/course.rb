class Course < ApplicationRecord
  has_one :message_board, dependent: :destroy
  has_and_belongs_to_many :users
  has_and_belongs_to_many :degrees

  validates :name, presence: true, length: { maximum: 100 }
  validates :credit, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :professor, presence: true, length: { maximum: 100 }
end
