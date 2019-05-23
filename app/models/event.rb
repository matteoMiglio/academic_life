class Event < ApplicationRecord
  belongs_to :group
  has_many :participants, dependent: :destroy
  has_many :users, :through => :participants

  default_scope -> { order(appointment: :asc) }

  validates :group, presence: true
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 300 }
  validates :appointment, presence: true, date: true
  validates :place, presence: true, length: { maximum: 100 }
end
