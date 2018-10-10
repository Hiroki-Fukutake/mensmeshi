Rails.application.routes.draw do
  devise_for :users, controllers: {
  	registrations: 'front/registrations'
  }



  namespace :front do
  	resources :users
    resources :post_images
  end
  root 'top#index'
end
