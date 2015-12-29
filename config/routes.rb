Rails.application.routes.draw do
  root "static_pages#home"
  get "help" => "static_pages#help"
  get "about" => "static_pages#about"
  get "contact" => "static_pages#contact"
  get "about" => "static_pages#about"
  devise_for :users
  resources :questions

  namespace :admin do
    root "categories#index"
    resources :users
    resources :categories
    resources :questions
  end
end
