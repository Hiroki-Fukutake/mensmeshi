Rails.application.routes.draw do

  root 'top#index'
  get 'admin/users/top' => 'admin/users#top'
  devise_for :users, controllers: {
  	registrations: 'front/registrations'
  }

  namespace :front do
  	resources :users
    resources :post_images do
  		resource :favorites, only: [:create, :destroy]
      resource :post_comments, only: [:create, :destroy]
    end
  end

  namespace :admin do
    resources :users
  end
end
