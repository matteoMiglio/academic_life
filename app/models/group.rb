class Group < ApplicationRecord
  belongs_to :message_board
  has_many :event
  has_many :join
  has_many :user, :through => :join
end
