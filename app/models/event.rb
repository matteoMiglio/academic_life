class Event < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_and_belongs_to_many :users

  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 300 }
  validates :appointment, presence: true, date: true 
  validates :place, presence: true, length: { maximum: 100 }
end
