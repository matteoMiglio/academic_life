class Category < ApplicationRecord
  has_many :documents, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
end
