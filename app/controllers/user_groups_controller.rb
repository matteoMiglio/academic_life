class UserGroupsController < ApplicationController
  def index
    @groups = current_user.groups
    @groups.each do |group|
      group.members.each { |member| member.membership if current_user.id == member.user_id }
      group.message_board
      group.message_board.course
    end
  end
end
