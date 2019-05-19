class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user, presence: true
  validates :post, presence: true
  validates :description, presence: true
  validates :description, length: { maximum: 255, too_long: "Commento troppo lungo!" }

  scope :ordered, -> { order('created_at asc') }
  scope :paginated, -> (page, entries) { includes(:user)
                                         .paginate(page: page, per_page: 3, total_entries: entries)
                                         .ordered }
end
