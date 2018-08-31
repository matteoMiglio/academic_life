class User < ApplicationRecord
  has_many :event
  has_many :post
  has_many :document
  has_many :review
  has_many :message_board, :through => :review
  has_many :registered
  has_many :course, :through => :registered
  has_many :rate
  has_many :message_board, :through => :rate
  has_many :participate
  has_many :event, :through => :participate
  has_many :join
  has_many :group, :through => :join
  has_many :comment
  has_many :post, :through => :comment
  has_many :approval
  has_many :post, :through => :approval
end
