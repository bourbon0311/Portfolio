class UsersController < ApplicationController
<<<<<<< HEAD
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update, :edit]

  def show
    @user = User.find(params[:id])
    @foods = @user.foods
    @food = Food.new
  end

  def index
    @users = User.all
    @user = User.new
    @user = current_user
    @food = Food.new
    @search_users = User.all.page(params[:page]).search(params[:search])
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path, notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
    redirect_to user_path(current_user)
    end
  end
=======
>>>>>>> origin/master
end
