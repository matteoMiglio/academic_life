# NOTIFICHE COMMENTI
Comment.all.each do |comment|
  # creo la notifica per il proprietario del post
  Notification.create(recipient: comment.post.user, 
                      actor: comment.user, 
                      action: "ha commentato il tuo post.", 
                      notifiable: comment)

  # creo le notifiche per tutti quelli che hanno commentato un post
  comment.post.comments.group(:user_id).uniq.each do |c2|
    if comment.user != c2.user
      Notification.create(recipient: c2.user, 
                          actor: comment.user, 
                          action: "ha commentato un post nel quale sei coinvolto.", 
                          notifiable: comment)
    end
  end
end

# NOTIFICHE GRUPPI
Group.all.each do |group|

  @creator = group.members.where(membership: "creator").uniq.first

  if not @creator.nil?
    group.members.each do |member|

      if member.membership == "invited"
        Notification.create(recipient: member.user, 
                            actor: @creator.user, 
                            action: "ti ha invitato in un gruppo privato.", 
                            notifiable: group)
      end
    end
  end
end