Rails.application.routes.draw do
    devise_for :users
  get 'users/show'
  get 'users/edit'
    resources :books, only: [:new, :create, :index, :show, :destroy]
    resources :users, only: [:show, :edit, :update]
    root to: "homes#top"
  get 'homes/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
