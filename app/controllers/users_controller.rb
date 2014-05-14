class UsersController < ApplicationController
  before_filter :require_login, only: [:show, :edit, :update, :destroy]
  before_filter :load_commentable

  def index
  end

  def dashboard #main page for user. user redirected to this page after signup/login
    @comment = @commentable.comments.build
    @comments = @commentable.comments.order('comments.created_at DESC').page params[:page]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      auto_login(@user) 
      redirect_to new_user_goal_path(@user), notice: "Welcome to ThinkFit.Me!"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to dashboard_user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name, :height, :weight, :gender)
  end

end
