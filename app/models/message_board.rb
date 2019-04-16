class MessageBoard < ApplicationRecord
  belongs_to :course
  has_many :posts
  has_many :groups
  has_many :documents
  has_many :reviews
  has_many :users, :through => :reviews
  has_many :rates
  has_many :users, :through => :rates

  validates :course, presence: true
end
