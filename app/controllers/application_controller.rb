class ApplicationController < ActionController::Base

  def authenticate_admin_user!
    auth = request.env['omniauth.auth']
    if auth.present?
      admin_user = AdminUser.from_omniauth(auth)
      sign_in admin_user
    else
      redirect_to '/auth/azure_oauth2'
    end
  end

  # def after_sign_in_path_for(resource)
  #   if resource.class == AdminUser
  #     admin_root_path
  #   elsif resource.class == User
  #     dashboard_index_path
  #   end
  # end

  def after_sign_in_path_for(resource)
     admin_dashboard_path
  end

  def current_admin_user
    @current_admin_user ||= AdminUser.find(session[:admin_user_id]) if session[:admin_user_id].present?
  end
end
