class Member < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :user, presence: true
  validates :group, presence: true
  validates :membership, presence: true, inclusion: { in: %w(undefined, member, creator) }

  after_destroy do 
    Group.find(group_id).destroy if membership == 'creator'
  end
end