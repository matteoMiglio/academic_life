class Course < ApplicationRecord
  has_one :message_board
  has_and_belongs_to_many :users
  has_and_belongs_to_many :degrees
end
