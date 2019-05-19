# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # verifico che l'utente veda solo i corsi a cui è iscritto
    can :read, User, id: user.id
    can :read, Course
    
    # verifico che l'utente veda solo bacheche di corsi a cui è iscritto
    can :read, MessageBoard, course: { users: { id: user.id } }
    can :read, Post
    can :create, Post
    can :destroy, Post, user_id: user.id
    #can :update, Member, membership: "invited", user_id: user.id
  end
end
