Rails.application.routes.draw do

  devise_for :admins
  root 'top#index'
  get 'admin/users/top' => 'admin/users#top'
  devise_for :users, controllers: {
  	registrations: 'front/registrations',
    sessions: 'front/sessions'
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
