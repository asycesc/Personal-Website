Rails.application.routes.draw do
  resources :portfolios, except: [:show]

  get 'angular_items', to: 'portfolios#angular'

  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'about', to: 'pages#about'

  get 'contact', to: 'pages#contact'

  resources :blogs do
  	member do
  		get :status_control	
  	end
  end

  root to: 'pages#home'
end