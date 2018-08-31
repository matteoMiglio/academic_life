class Event < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :participate
  has_many :user, :through => :participate
end
