Rails.application.routes.draw do
#resources :renting
resources :users, :items do
   resources :reviews, only: :create
  end
#resources :city
#  get '/city/:city_id/users', to: 'users#index', as: :city_users

end
