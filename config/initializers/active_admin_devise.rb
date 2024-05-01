module ActiveAdmin
  module Devise
    def self.controllers
      {
        sessions: "two_factor_auth/sessions",
        passwords: "active_admin/devise/passwords",
        unlocks: "active_admin/devise/unlocks",
        registrations: "active_admin/devise/registrations",
        confirmations: "active_admin/devise/confirmations"
      }
    end 
       
    def self.controllers_for_filters
      [
        ::TwoFactorAuth::SessionsController,
        PasswordsController,
        UnlocksController,
        RegistrationsController,
        ConfirmationsController,
      ]
    end
  end
end