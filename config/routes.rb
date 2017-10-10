Rails.application.routes.draw do
  resources :comments
	devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
	resources :portfolios  do
		put :sort, on: :collection
	end

	get 'angular_items', to: 'portfolios#angular'

	get 'about', to: 'pages#about'

	get 'contact', to: 'pages#contact'
	get 'news', to: 'pages#tech_news'

	resources :blogs do
		member do
			get :status_control	
		end
	end

	root to: 'pages#home'
end