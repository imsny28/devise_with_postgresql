module AdminUsers
  class SessionsController < ::Devise::SessionsController
    layout 'active_admin_logged_out'
    helper ::ActiveAdmin::ViewHelpers

    def after_sign_out_path_for(resource)
      '/admin'
    end

  end
end
