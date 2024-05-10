Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  # devise_config = ActiveAdmin::Devise.config
  # devise_config[:controllers][:omniauth_callbacks] = 'admin_users/omniauth_callbacks'
  # devise_config[:skip] = [:sessions]
  # devise_for :admin_users, devise_config
  #
  # # devise_scope :admin_user do
  # #   get 'sign_in', :to => 'devise/sign_in', as: :new_admin_user_session
  # #   get 'sign_out', :to => 'devise/sign_out', :as => :destroy_admin_user_session
  # # end
  #
  # ActiveAdmin.routes(self)

  root 'welcome#index'
  # root to: redirect('/admin')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
