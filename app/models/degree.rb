class Degree < ApplicationRecord
  belongs_to :department
  has_many :belongs
  has_many :courses, :through => :belongs
end
