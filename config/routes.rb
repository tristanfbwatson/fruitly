Fruitly::Application.routes.draw do
  


  resources :orders

  resources :products do
    resource :basket
  end

    root to: "products#index"

      devise_for :admin_users, ActiveAdmin::Devise.config
      ActiveAdmin.routes(self)


end
