class Post < ApplicationRecord
  belongs_to :user
  belongs_to :message_board
  has_many :comments
  has_many :approvals, dependent: :destroy

  validates :user, presence: true
  validates :message_board, presence: true
  validates :description, presence: true, length: { maximum: 255, too_long: "Post troppo lungo!" }

  scope :ordered,    -> { order('created_at desc') }
  scope :pagination, -> (page) { includes(:user).paginate(page: page, per_page: 5).ordered }
  #scope :with_users, -> { includes(:user).ordered.each do |post|
  #  post.user.name
  #  post.user.surname
  #end }
end
