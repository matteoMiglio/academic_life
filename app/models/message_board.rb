class MessageBoard < ApplicationRecord
  belongs_to :course
  has_many :post
  has_many :group
  has_many :document
  has_many :review
  has_many :user, :through => :review
  has_many :rate
  has_many :message_board, :through => :rate
end
