Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope "(:locale)", locale: /en|vi|ja/ do
    root "static_pages#home"
    devise_for :users
    resources :projects
    resources :blogs, :contacts, :abouts
    resources :projects do
      resources :teams
    end
    resources :tops

    namespace :admin do
      root "static_pages#home"
      resources :blogs, :projects, :contacts, :abouts, :users, :categories, :techniques, :roles
    end
  end
end
