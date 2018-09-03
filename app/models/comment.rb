class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # Validations
  validates :user, :post, :description, presence: true
  validates :description, length: { maximum: 255, too_long: "Commento troppo lungo!" }
end
