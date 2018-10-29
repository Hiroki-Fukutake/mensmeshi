Rails.application.routes.draw do

  root 'top#index'
  get 'admin/users/top' => 'admin/users#top'
  # patch 'front/users/:id' => 'front/post_images#update'
  patch 'front/profile/:id' => 'front/users#update'
  devise_for :admins

  devise_for :users, controllers: {
  	registrations: 'front/registrations',
    sessions: 'front/sessions'
  }

  namespace :front do
  	resources :users
    resources :post_images do
  		resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
  end

  namespace :admin do
    resources :users
  end
end
