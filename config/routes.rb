Rails.application.routes.draw do
  get '/' => "homes#index"
  get 'about' => "homes#about"

  resources :posts
  resources :users

  #ダメなルート
  # get 'posts/index' => "posts#index"
  # get 'posts/edit' => "post#edit"
  # get "new" => "posts#new"
  # post "posts/create" => "posts#create"
  # get 'posts/:id' => "posts#show"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
