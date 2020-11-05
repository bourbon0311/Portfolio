class Users::RegistrationsController < Devise::RegistrationsController
  def new
    redirect_to :root if user_signed_in?
    super
  end
  def detail
    @user = User.find_by(id: params[:id])
  end
  def after_sign_up_path_for(resource)
    "/users/#{current_user.id}"
  end

end
