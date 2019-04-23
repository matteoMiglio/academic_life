module GroupsHelper
  def membership(members)
    member = members.find { |member| member.user_id == current_user.id }
    member.membership
  end

  def color(role)
    case role
    when "creator"
      "primary"
    when "member"
      "success"
    when "invited"
      "warning"
    end
  end
end
