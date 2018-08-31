class Group < ApplicationRecord
  belongs_to :message_board
  has_many :events
  has_and_belongs_to_many :users
end
