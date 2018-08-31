class Course < ApplicationRecord
  has_one :message_board
  has_many :registered
  has_many :user, :through => :registered
  has_many :belong
  has_many :degree, :through => :belong
end
