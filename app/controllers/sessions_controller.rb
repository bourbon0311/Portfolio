class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # GET /resource/sign_in
  def new
    redirect_to :root if user_signed_in?
  end
  def after_sign_in_path_for(resource)
    "/users/#{current_user.id}"
  end
  # POST /resource/sign_in
  def create
    user = User.find_by(name: params[:user][:name])
    if user
      sign_in user
      redirect_to user
      flash[:notice] = "successfully"
    else
      render 'new'
    end
  end
  # DELETE /resource/sign_out
  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to :
    flash[:notice] = "successfully"
  end
  # protected
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
