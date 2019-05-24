# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :show, User, id: user.id
    can :read, MessageBoard, course: { users: { id: user.id } }

    # nested resources of user
    can :read, Course
    
    # nested resources of message board
    can [:read, :create], Post
    can :destroy, Post, user_id: user.id

    can :read, Group, members: { user_id: user.id }
    can :create, Group
    can :destroy, Group, members: { user_id: user.id, membership: "creator" }

    # nested resources of group
    can :read, Member
    can :create, Member, group: { members: { user_id: user.id, membership: "creator" } }
    can :update, Member, membership: "invited", user_id: user.id
    can :destroy, Member, user_id: user.id
    can :destroy, Member, group: { members: { user_id: user.id, membership: "creator" } }

    # nested resources of post
    can :create, Comment
    can :destroy, Comment, user_id: user.id
  end
end
