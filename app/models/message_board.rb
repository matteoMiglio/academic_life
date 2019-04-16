class MessageBoard < ApplicationRecord
  belongs_to :course
  has_many :posts, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :documents, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :users, :through => :reviews
  has_many :rates, dependent: :destroy
  has_many :users, :through => :rates

  validates :course, presence: true
end
