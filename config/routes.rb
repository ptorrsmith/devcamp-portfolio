Rails.application.routes.draw do
  
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}

  # resources :portfolio_items, except: [:show] do
  #   put :sort, on: collection
  # end


  # resources :portfolio_items, except: [:show] do
  # decided not to override the show path as has path-generatin side effects I've not figured out around yet
    resources :portfolio_items do
      collection do
			put 'sort'
		end
    # resources :portfolio_items, except: [:show] do
    #   put :sort, on: collection
    # end

		# member do
		# 	put 'some_method'
		# end
	end

  get 'rails_items', to: 'portfolio_items#ruby_on_rails_portfolio_items'
  

  get 'javascript_items', to: 'portfolio_items#javascript_portfolio_items'
  # override default plural to make singular
  # decided not to override the show path as has path-generatin side effects I've not figured out around yet
  # get 'portfolio_item/:id', to: 'portfolio_items#show', as: 'portfolio_item_show'
  # get 'portfolio_items/:id', to: 'portfolio_items#show', as: 'portfolio_item_show'

  # get 'pages/home'
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'
  
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
