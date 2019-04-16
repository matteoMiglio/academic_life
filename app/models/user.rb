class User < ApplicationRecord
  acts_as_authentic

  has_many :events
  has_many :posts
  has_many :documents
  has_many :comments
  has_many :reviews
  has_many :message_boards, :through => :reviews
  has_many :rates
  has_many :message_boards, :through => :rates
  has_many :approvals
  has_and_belongs_to_many :courses
  has_and_belongs_to_many :events
  has_and_belongs_to_many :groups
end
