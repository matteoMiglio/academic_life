class MessageBoard < ApplicationRecord
  validates :course_id, presence: true

  belongs_to :course
  has_many :posts
  has_many :groups
  has_many :documents
  has_many :reviews
  has_many :users, :through => :reviews
  has_many :rates
  has_many :message_boards, :through => :rates
end
