class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # Validations
  validates :user, presence: true
  validates :post, presence: true
  validates :description, presence: true

  validates :description, length: { maximum: 255, too_long: "Commento troppo lungo!" }

  scope :ordered, -> { order('created_at asc') }
end
