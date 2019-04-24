class Member < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :user, presence: true
  validates :group, presence: true
  validates :membership, presence: true, inclusion: { in: %w(invited member creator) }

  scope :find_creator, -> { find_by(membership: "creator") }
  scope :pagination,   -> (page) { includes(:user).paginate(page: page, per_page: 5) }

  after_destroy do 
    Group.find(group_id).destroy if membership == 'creator'
  end
end