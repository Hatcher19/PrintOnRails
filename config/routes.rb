PrintOnRails::Application.routes.draw do 
  root :to => "pages#home"
  get "pages/home"
  resources :accounts

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_scope :admin_user do
    get '/logout', :to => 'active_admin/devise/sessions#destroy', :as => "destroy_admin_user_session"
    get '/login', :to => 'active_admin/devise/sessions#new', :as => "new_admin_user_session"
    post '/login', :to => 'active_admin/devise/sessions#create', :as => "create_admin_user_session"
    get '/register', :to => 'devise/registrations#new', :as => "new_admin_user_registration"
    post '/register', :to => 'devise/registrations#create', :as => "create_admin_user_registration"
  end
end
