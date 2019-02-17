Rails.application.routes.draw do
  
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :portfolio_items, except: [:show]
  get 'javascript_items', to: 'portfolio_items#javascript_portfolio_items'
  # override default plural to make singular
  get 'portfolio_item/:id', to: 'portfolio_items#show', as: 'portfolio_item_show'

  # get 'pages/home'
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root 'pages#home'
  # root to: 'pages#home'
  # get 'home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
