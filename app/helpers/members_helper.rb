module MembersHelper
  def member_link(current_user, member, creator)
    if current_user.id == member.user_id and current_user.id == creator.user_id
      link_to "Delete Group", "#",
                              method: :delete,
                              data: { confirm: "Sei sicuro di voler eliminare il gruppo?" },
                              class: "card-link text-danger"
    elsif current_user.id == member.user_id
      link_to "Leave", "#",
                       method: :delete,
                       data: { confirm: "Sei sicuro di voler lasciare il gruppo?" },
                       class: "card-link text-danger"
    elsif current_user.id == creator.user_id
      link_to "Remove", "#",
                        method: :delete,
                        data: { confirm: "Sei sicuro di voler rimuovere questo membro?" },
                        class: "card-link text-warning"
    end
  end
end
