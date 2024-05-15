Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_scope :admin_user do
    get '/auth/azure_oauth2/callback', to: 'admin_users/omniauth_callbacks#azure_oauth2', as: :azure_oauth2_callback
  end
  ActiveAdmin.routes(self)

  root 'welcome#index'

  get '/auth/azure_oauth2', as: :azure_oauth2
  # get '/auth/azure_oauth2/callback',to: 'admin_user/omniauth_callbacks#azure_oauth2', as: :azure_oauth2_callback
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
