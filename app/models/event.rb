class Event < ApplicationRecord
  belongs_to :group
  has_many :participants, dependent: :destroy
  has_many :users, :through => :participants

  validates :group, presence: true
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 300 }
  validates :appointment, presence: true, date: true
  validates :place, presence: true, length: { maximum: 100 }

  default_scope -> { order(appointment: :asc) }
  scope :find_next, -> { where('appointment > ?', DateTime.now.beginning_of_day) }
end
