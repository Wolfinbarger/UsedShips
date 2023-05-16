class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

end
