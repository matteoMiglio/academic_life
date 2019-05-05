class Notification < ApplicationRecord
  belongs_to :recipient, class_name: "User"
  belongs_to :actor, class_name: "User"
  belongs_to :notifiable, polymorphic: true

  # validates :recipient, presence: true
  # validates :actor, presence: true
  # validates :notifiable, presence: true

  scope :unread, ->{ where(read_at: nil) }
  scope :ordered,    -> { order('created_at desc') }
  scope :pagination, -> (page, entries) { paginate(page: page, per_page: 5, total_entries: entries)
                                          .ordered }
end
