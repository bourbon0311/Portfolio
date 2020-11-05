class Users::SessionsController < Devise::SessionsController
  def new
    redirect_to :root if user_signed_in?
  end

  def after_sign_in_path_for(resource)
    "/users/#{current_user.id}"
  end

  def create
    if params[:session]
      user = User.find_by(name: params[:session][:name])
    else
      user = User.find_by(name: params[:user][:name])
    end

    if user
      sign_in user
      redirect_to user
      flash[:notice] = "ログインしました"
    else
      render 'new'
    end
  end

  def destroy
    user = User.find(current_user.id)
    sign_out(user)
    redirect_to :root
    flash[:notice] = "ログアウトしました"
  end
end
