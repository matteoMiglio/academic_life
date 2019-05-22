module GroupsHelper
  def current_member(members)
    members.find { |member| member.user_id == current_user.id }
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

  def accept_link(member)
    role = member.membership
    options = { method: :patch, class: "card-link text-success" }
    url = message_board_group_member_url(@message_board, @group, member)
    link_to "Accept", url, options if role == "invited"
  end

  def exit_link(member)
    case member.membership
      when "creator"
        text = "Delete Group"
        options = { method: :delete,
                    data: { confirm: "Sei sicuro di voler eliminare il gruppo?" },
                    class: "card-link text-danger" }
        url = message_board_group_url(@message_board, @group)
      when "member"
        text = "Leave"
        options = { method: :delete,
                    data: { confirm: "Sei sicuro di voler lasciare il gruppo?" },
                    class: "card-link text-danger" }
        url = message_board_group_member_url(@message_board, @group, member)
      when "invited"
        text = "Refuse"
        options = { method: :delete,
                    data: { confirm: "Sei sicuro di voler rifiutare l'invito?" },
                    class: "card-link text-danger" }
        url = message_board_group_member_url(@message_board, @group, member)
    end
    link_to text, url, options
  end

  def members_link(role)
    url = message_board_group_members_url(@message_board, @group)
    options = { class: "card-link" }
    link_to "Members", url, options if role == "creator" or role == "member"
  end
end
