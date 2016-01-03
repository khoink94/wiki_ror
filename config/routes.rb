Rails.application.routes.draw do
 
  resources :guests
  get 'articles/votes'

  resources :comments
  get 'olds/result'

  resources :olds
  get 'articles/result'

  get 'articles/search'

  devise_for :users
 resources :articles

 resources :categories
 get 'categories/show'

 root "articles#index"
end
