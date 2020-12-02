class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.new(friend_id: params[:user_id], status: false)

    if @friendship.save
      redirect_to users_path, notice: 'Invitation is sent'
    else
      redirect_to users_path, alert: 'Something went wrong'
    end
  end
end
