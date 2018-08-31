class Degree < ApplicationRecord
  belongs_to :department
  has_many :belong
  has_many :course, :through => :belong
end
