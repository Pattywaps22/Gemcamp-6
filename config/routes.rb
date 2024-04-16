Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_for :users
  root "welcome#home"

  get 'home', to: 'welcome#home'

  get 'about', to: 'welcome#about'

  get 'contact', to: 'welcome#contact'

  resources :posts do
    resources :comments, except: :show
    resources :categories, except: :show
  end
end
