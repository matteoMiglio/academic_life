class Approval < ApplicationRecord
  belongs_to :post
  belongs_to :user

  # Validations
  validates :user, presence: true
  validates :post, presence: true
end
