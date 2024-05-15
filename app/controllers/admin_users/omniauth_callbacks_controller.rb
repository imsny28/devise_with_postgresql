class AdminUsers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def azure_oauth2
    auth = request.env['omniauth.auth']
    @admin_user = AdminUser.from_omniauth(auth)

    if @admin_user.persisted?
      # sign_in_and_redirect(admin_root_path, event: :authentication)
      # byebug
      sign_in_and_redirect @admin_user, event: :authentication, location: admin_root_path


      # sign_in(admin_user, event: :authentication)
      # redirect_to admin_admin_users_path
    else
      redirect_to new_admin_user_session_path, alert: 'Authentication failed.'
    end
  end
end
