class Review < ApplicationRecord
  belongs_to :user
  belongs_to :message_board

  validates :user, presence: true
  validates :message_board, presence: true
  validates :user, uniqueness: { scope: :message_board }
  validates :feedback, presence: true, length: { minimum: 5, maximum: 500 }

  scope :ordered, -> { order('created_at desc') }
  scope :paginated, -> (page, entries) { includes(:user)
                                         .paginate(page: page, per_page: 5, total_entries: entries)
                                         .ordered }
end
