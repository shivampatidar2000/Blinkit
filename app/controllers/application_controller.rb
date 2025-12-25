# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :role ])
  end

  # 🔥 Redirect AFTER LOGIN
  def after_sign_in_path_for(resource)
    redirect_path_by_role(resource)
  end

  # 🔥 Redirect AFTER SIGNUP
  def after_sign_up_path_for(resource)
    redirect_path_by_role(resource)
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  private

  def redirect_path_by_role(user)
    if user.seller?
      items_path                 # Seller → Items page
    elsif user.customer?
      new_address_path           # Customer → Create Address
    elsif user.rider?
      orders_path                # Rider → Orders page
    else
      root_path
    end
  end
end
