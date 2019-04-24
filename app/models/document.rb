class Document < ApplicationRecord
  belongs_to :message_board
  belongs_to :user
  belongs_to :category

  has_one_attached :file

  validates :message_board, presence: true
  validates :user, presence: true
  validates :category, presence: true
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 300 }
  #validates :path, presence: true, length: { maximum: 70 }

  scope :pagination, -> (page) { includes(:user).paginate(page: page, per_page: 5) }
end
