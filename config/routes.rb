Rails.application.routes.draw do


  devise_for :masters, controllers: {
    sessions:      'master/sessions',
  }
  devise_for :users, controllers: {
    sessions:      'public/sessions',
    registrations: 'public/registrations'
  }


  root to: "public/homes#top"





  scope module: :public do

   resources :users, only: [:show, :index, :edit, :update]

   resources :movies, only: [:show, :index, :edit, :update, :new, :create]

   get 'about' => 'homes#about', as: "about"

  end

  namespace :master do

   resources :users, only: [:show, :index, :edit, :update]

   resources :movies, only: [:show, :index, :edit, :update]

   resources :genres, only: [:show, :index, :edit, :update, :new]




  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
