Rails.application.routes.draw do
  
  resources :portfolio_items

  # get 'pages/home'
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
  resources :blogs

  root to: 'pages#home'
  # get 'home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
