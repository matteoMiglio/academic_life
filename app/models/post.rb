class Post < ApplicationRecord
  belongs_to :user
  belongs_to :message_board
  has_many :comments
  has_many :users, :through => :comments
  has_many :approvals, dependent: :destroy
  has_and_belongs_to_many :users

  validates :user, presence: true
  validates :message_board, presence: true
  validates :description, presence: true, length: { maximum: 255, too_long: "Post troppo lungo!" }

  scope :ordered, -> { order('created_at desc') }
  scope :to_index, -> { includes(:users).ordered.each do |post|
                          post.user.name
                          post.user.surname
                        end }
end
