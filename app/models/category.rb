class Category < ApplicationRecord
  has_many :documents

  validates :name, presence: true, length: { maximum: 100 }
end
