Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static_pages#home"
  resources :projects
  resources :blogs, :contacts
  resources :projects do
    resources :teams
  end
  resources :tops
  namespace :admin do
    root "static_pages#home"
  end
end
