module PostsHelper
  def find_my_approval(approvals)
    approvals.find { |approval| approval.user_id == current_user.id }
  end

  def show_link(post)
    options = { class: "card-link" }
    url = message_board_post_url(post.message_board_id, post.id)
    link_to "Show", url, options if current_page?(action: 'index')
  end

  def delete_link(post)
    options = { method: :delete,
                data: { confirm: "Sei sicuro?" },
                class: "card-link" }
    url = message_board_post_url(post.message_board_id, post.id)
    link_to "Delete", url, options if current_user.id == post.user_id
  end
end
