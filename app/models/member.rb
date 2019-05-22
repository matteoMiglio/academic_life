class Member < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :user, presence: true
  validates :group, presence: true
  validates :user, uniqueness: { scope: :group }
  validates :membership, presence: true, inclusion: { in: %w(invited member creator) }

  scope :find_creator, -> { find_by(membership: "creator") }
  scope :paginated, -> (page, entries) { includes(:user)
                                         .paginate(page: page, per_page: 5, total_entries: entries) }
end