module MembersHelper
  def member_link(current_user, member, creator)
    if current_user.id == member.user_id and current_user.id == creator.user_id
      link_to "Delete Group", message_board_group_url(@message_board, @group),
                              method: :delete,
                              data: { confirm: "Sei sicuro di voler eliminare il gruppo?" },
                              class: "card-link text-danger"
    elsif current_user.id == member.user_id
      link_to "Leave", message_board_group_member_url(@message_board, @group, member),
                       method: :delete,
                       data: { confirm: "Sei sicuro di voler lasciare il gruppo?" },
                       class: "card-link text-danger"
    elsif current_user.id == creator.user_id
      link_to "Remove", message_board_group_member_url(@message_board, @group, member),
                        method: :delete,
                        data: { confirm: "Sei sicuro di voler rimuovere questo membro?" },
                        class: "card-link text-warning"
    end
  end

  def full_name(user)
    user.name + " " + user.surname
  end
end
