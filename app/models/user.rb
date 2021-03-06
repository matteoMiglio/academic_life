class User < ApplicationRecord
  acts_as_authentic

  has_many :events, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :documents, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :message_boards, :through => :reviews
  has_many :rates, dependent: :destroy
  has_many :message_boards, :through => :rates
  has_many :members, dependent: :destroy
  has_many :groups, :through => :members
  has_many :approvals, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :events, :through => :participants
  has_many :notifications, foreign_key: :recipient_id
  
  has_and_belongs_to_many :courses
end
