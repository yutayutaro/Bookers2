Rails.application.routes.draw do
    devise_for :users
    resources :books, only: [:create, :index, :show, :destroy, :edit, :update]
    resources :users, only: [:show, :edit, :update,:index]
    root to: "homes#top"
  get 'home/about'=>"homes#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
