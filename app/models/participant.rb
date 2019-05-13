class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :user, presence: true
  validates :event, presence: true
  validates :role, presence: true, inclusion: { in: %w(member creator) }

  scope :pagination,   -> (page, entries) { includes(:user).paginate(page: page, per_page: 5, total_entries: entries) }
end
