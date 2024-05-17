class AdminUsers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def azure_oauth2
    auth = request.env['omniauth.auth']
    @admin_user = AdminUser.from_omniauth(auth)

    if @admin_user.persisted?
      sign_in_and_redirect @admin_user, event: :authentication
    else
      redirect_to new_admin_user_session_path, alert: 'Authentication failed.'
    end
  end

  def azure_activedirectory_v2
    auth = request.env['omniauth.auth']
    @admin_user = AdminUser.from_omniauth(auth)

    if @admin_user.persisted?
      sign_in_and_redirect @admin_user, event: :authentication
    else
      redirect_to new_admin_user_session_path, alert: 'Authentication failed.'
    end
  end
end
