class Event < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_many :participants, dependent: :destroy

  validates :group, presence: true
  validates :user, presence: true
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 300 }
  validates :appointment, presence: true, date: true
  validates :place, presence: true, length: { maximum: 100 }

  default_scope -> { order(appointment: :asc) }
  scope :find_next, -> { where('appointment > ?', DateTime.now.beginning_of_day) }
  scope :paginated, -> (page, entries) { paginate(page: page, per_page: 4, total_entries: entries)}

  validate :appointment_date

  private

    def appointment_date
      return if appointment.blank?

      if appointment <= DateTime.now.beginning_of_day
        errors.add(:appointment, "must be after today")
      end
  end
end
