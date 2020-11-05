Rails.application.routes.draw do
	devise_for :users, :controllers => {
    :sessions => 'users/sessions' ,
    :registrations => 'users/registrations'
  }

 get 'favorites/create'
 get 'favorites/delete'
 root 'home#top'
 get '/searchs' => 'searchs#result_user'
 resources :users, only: [:show,:index,:edit,:update]
 resources :foods
 get 'home/about'
 get 'relationships/follower'
 get 'relationships/followed'
 resources :foods, only: [:create, :index, :show] do
   resource :favorites, only: [:create, :destroy]
   resources :food_comments, only: [:create, :destroy, :index]
 end
    #resources :relationships, only: [:create, :destroy]
 post 'follow/:id' => 'relationships#follow', as: 'follow'
 post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
 get  '/rank', to: 'users#rank'
end
