module UsersHelper
  def invite_status(invitee)
    res = ''
    return if current_user.id == invitee.id
    return if current_user.friend?(invitee)

    if current_user.pending_friends.include?(invitee)
      res << link_to('Pending Request', '#')
    elsif current_user.friend_requests.include?(invitee)
      res << link_to('Accept', accept_path(user_id: invitee.id), method: :put)
      res << ' | '
      res << link_to('Reject', reject_path(user_id: invitee.id), method: :delete)
    elsif current_user.friend?(invitee)
      res << link_to('Unfriend', unfriend_path(user_id: friend.id), method: :delete)
    else
      res << link_to('Add Friend', invite_path(user_id: invitee.id), method: :post)
    end

    res.html_safe
  end
end
