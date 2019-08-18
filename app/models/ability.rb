# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
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
      can :index, Member
      # only the creator can add and delete other members
      can [:create, :destroy], Member, group: { members: { user_id: user.id, membership: "creator" } }
      # an invited user can refuse an invite or join a group
      can [:update, :destroy], Member, membership: "invited", user_id: user.id
      # an membered user can leave a group
      can :destroy, Member, membership: "member", user_id: user.id

      can :create, Event
      can :destroy, Event, participants: { user_id: user.id, role: "creator" }

      # nested resources of post
      can :create, Comment
      can :destroy, Comment, user_id: user.id

      can :create, Approval
      can :destroy, Approval, user_id: user.id
    end
  end
end
