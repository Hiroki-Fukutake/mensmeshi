Rails.application.routes.draw do
  devise_for :users, controllers: {
  	registrations: 'front/registrations'
  }


  namespace :front do
  	resources :users
    resources :post_images do
  		resource :favorites, only: [:create, :destroy]
    end
  end
  root 'top#index'
end
