class Degree < ApplicationRecord
  belongs_to :department
  has_and_belongs_to_many :courses

  validates :department, presence: true
end
