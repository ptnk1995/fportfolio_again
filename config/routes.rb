Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope "(:locale)", locale: /en|vi|ja/ do
    root "static_pages#home"
    devise_for :users
    resources :projects
    resources :blogs, :contacts, :abouts
    resources :contacts
    resources :projects do
      resources :teams
    end
    resources :tops


  end
  namespace :admin do
    root "static_pages#home"
    resources :blogs, :projects, :contacts, :abouts, :users, :techniques, :roles, :features
    resources :categories, :errors
  end
end
