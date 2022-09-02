Rails.application.routes.draw do
  resources :posts, only: [:create, :new, :index]
  # get 'splash/index'
  devise_for :users

  # Define your applicats, only: [:index, :new, :create]tion routes per the DSL in https://guides.rubyonrails.org/routing.html
  # unauthenticated do
  #   root "splash#index"
  # end

  root 'posts#index'

  # authenticated :user do
  #   root 'posts#index', as: :authenticated_root
  # end
end
