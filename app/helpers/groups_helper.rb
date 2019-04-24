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

  def group_link(role, url)
    options = { class: "card-link text-danger" }
    text = case role
      when "creator"
        "Delete Group"
      when "member"
        "Leave"
      when "invited"
        "Refuse"
    end
    link_to text, url, options
  end
end
