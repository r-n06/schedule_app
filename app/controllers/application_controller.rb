class ApplicationController < ActionController::Base
  before_action :config_parmitted_parameters, if: :devise_controller?

  private

  def config_parmitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :user_image])
  end
end
