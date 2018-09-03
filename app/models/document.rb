class Document < ApplicationRecord
  belongs_to :message_board
  belongs_to :user
  belongs_to :category

  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 300 }
  validates :path, presence: true, length: { maximum: 70 }
end
