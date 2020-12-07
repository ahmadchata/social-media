class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.new(friend_id: params[:user_id], confirmed: false)

    if @friendship.save
      redirect_to users_path, notice: 'Invitation is sent'
    else
      redirect_to users_path, alert: 'Something went wrong'
    end
  end

   def destroy
    @user = User.find(params[:user_id])

    if current_user.friend?(@user)
      redirect_to users_path, notice: 'Unfriend successfully'
    else
      redirect_to users_path, alert: 'Something went wrong with the rejection'
    end
  end
end
