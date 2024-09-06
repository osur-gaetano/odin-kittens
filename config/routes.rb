Rails.application.routes.draw do
  root "kittens#index"

  resources :kittens

  # get 'kittens/index'
  # get 'kittens/create'
  # get 'kittens/show'
  # get 'kittens/update'
  # get 'kittens/delete'
  # get 'kittens/edit'
  # get 'kittens/new'
end
