class Department < ApplicationRecord
  has_many :degree, dependent: :destroy
end
