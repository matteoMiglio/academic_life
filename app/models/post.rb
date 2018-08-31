class Post < ApplicationRecord
  belongs_to :user
  belongs_to :message_board
  has_many :comment
  has_many :user, :through => :comment
  has_many :approval
  has_many :user, :through => :approval
end
