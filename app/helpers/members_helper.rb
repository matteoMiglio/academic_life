module MembersHelper
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
