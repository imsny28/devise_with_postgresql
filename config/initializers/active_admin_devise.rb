module ActiveAdmin
  module Devise
    def self.controllers
      {
        sessions: "admin_users/sessions",
        omniauth_callbacks: 'admin_users/omniauth_callbacks',
        passwords: "active_admin/devise/passwords",
        unlocks: "active_admin/devise/unlocks",
        registrations: "active_admin/devise/registrations",
        confirmations: "active_admin/devise/confirmations"
      }
    end

    def self.controllers_for_filters
      [
        ::AdminUsers::SessionsController,
        ::AdminUsers::OmniauthCallbacksController,
        PasswordsController,
        UnlocksController,
        RegistrationsController,
        ConfirmationsController,
      ]
    end
  end
end
