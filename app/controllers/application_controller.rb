class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

protected
	def after_sign_in_path_for(resource)
    	if user_signed_in?
       	   shops_top_path
        else
       		new_admin_shop_path
    	end
  end

  def after_sign_up_path_for(resource)
    if  user_signed_in?
       		shops_top_path
    else
        new_admin_shop_path
    end
  end

  def after_sign_out_path_for(resource)
    if 	resource == :user
            shops_top_path
    else
       		new_admin_session_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

