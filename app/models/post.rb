class Post < ApplicationRecord
  belongs_to :user
  belongs_to :message_board
  has_many :comments, dependent: :destroy
  has_many :approvals, dependent: :destroy

  validates :user, presence: true
  validates :message_board, presence: true
  validates :description, presence: true, length: { maximum: 255, too_long: "Post troppo lungo!" }

  scope :ordered,    -> { order('created_at desc') }
  scope :pagination, -> (page, entries) { includes(:user, :approvals)
                                          .paginate(page: page, per_page: 5, total_entries: entries)
                                          .ordered }
end
