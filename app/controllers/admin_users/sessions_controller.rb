module AdminUsers
  class SessionsController < ::Devise::SessionsController
    layout 'active_admin_logged_out'
    helper ::ActiveAdmin::ViewHelpers

    def create
      admin_user = AdminUser.find_by(email: sign_in_params[:email])
      is_valid, error = authenticate(admin_user, sign_in_params[:password], sign_in_params[:otp_attempt])
      if is_valid
        flash.discard
        sign_in(admin_user, event: :authentication)
        redirect_to admin_admin_users_path
      else
        flash[:error] = error
        @admin_user = AdminUser.find_by(email: sign_in_params[:email]) || AdminUser.new
        render :new
      end
    end

    def after_sign_out_path_for(resource)
      '/admin'
    end

    private

    def authenticate(admin_user, password, otp_attempt)
      return [false, "Invalid email"] unless admin_user.present?
      return [false, "Invalid password"] unless admin_user.valid_password?(password)
      return [true, ""] unless admin_user.otp_required_for_login
      return [false, "Invalid authentication code"] unless admin_user.validate_and_consume_otp!(otp_attempt)
      return [true, ""]
    end
  end
end
