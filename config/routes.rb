Rails.application.routes.draw do
  
  resources :roles
  resources :qualifications
  # get 'topics/index'
  # get 'topics/show'

  # the above only creates these routes (autogenerated via rails g controller index show)
  # topics_index GET    /topics/index(.:format)                                                                  topics#index
  # topics_show GET    /topics/show(.:format)                                                                   topics#show

  # so a better way to do this... since we have a topic model
  resources :topics, only: [:index, :show]
  # this generates the following nicer routes, and gives as the :id parameter
  # topics GET    /topics(.:format)                                                                        topics#index
  # topic GET    /topics/:id(.:format)                                                                    topics#show

  # :comments generated by rails g resoure Comment ....
  # once implemented action cable, this not needed, as action cable provides access to web sockets, so not standard http routing
  # resources :comments
  
  
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

  # perhaps change this to comments_cable ??
  # this uses web sockets, so standard route for comments not needed... see at top
  mount ActionCable.server => '/cable'

  root 'pages#home'
  # root to: 'pages#home'
  # get 'home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
