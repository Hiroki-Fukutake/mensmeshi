Rails.application.routes.draw do

  root 'top#index'
  get 'admin/users/top' => 'admin/users#top'
  patch 'front/profile/:id' => 'front/users#update'
  get 'front/users/delete' => 'front/users#delete'
  get 'front/post_images/about'
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
