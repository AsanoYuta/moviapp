Rails.application.routes.draw do


  devise_for :masters, controllers: {
    sessions:      'master/sessions',
  }
  devise_for :users, controllers: {
    sessions:      'public/sessions',
    registrations: 'public/registrations'
  }


  root to: "public/homes#top"

  devise_scope :user do
    post 'sessions/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end




  scope module: :public do

   get '/search', to: 'searches#search'

   resources :users, only: [:show, :index, :edit, :update]

   get '/search/genres', to: 'searchs#genre'

   patch "user/withdraw" => 'users#withdraw', as: "withdraw"

   get '/confirm', to: 'users#confirm'

   resources :movies, only: [:show, :index, :destroy]do

    resource :favorites, only: [:create, :destroy]
    resources :movie_comments, only: [:create, :destroy]

   end


  end

  namespace :master do
   get '/search', to: 'searches#search'
   resources :users, only: [:show, :index, :edit, :update, :destroy]

   resources :movies, only: [:show, :index, :destroy] do
    resources :movie_comments, only: [:destroy]
   end


   resources :genres, only: [:show, :index, :create, :edit, :update, :new, :destroy]




  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
