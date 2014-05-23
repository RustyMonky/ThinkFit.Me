class FriendshipsController < ApplicationController

  def index
  end
  
  def show 
    
  end


  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = "Yay, you made a new friend"
      redirect_to friendships_path
    else
      flash[:alert] = "No friends for you"
      redirect_to users
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    if @friendship.destroy
      redirect_to friendships_path
    else
      flash[:alert] = "IT WORKS"
    end
  end
  private
  def friendship_params
    params.permit(:friend_id, :user_id)
  end
end
