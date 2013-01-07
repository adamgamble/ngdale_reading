NgdaleReading::Application.routes.draw do  root :to => "custom_pages#home"
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  resources :sms do
    collection do
      post "reply"
    end
  end

  resources :daily_readings

  resources :calls, :only => [:create]
end
