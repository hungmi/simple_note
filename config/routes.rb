Rails.application.routes.draw do
  get '/', to: redirect('/admin')
  get 'admin', to: redirect('/admin/payments')
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	namespace :admin do
		resources :payments
		resources :projects
		resources :periodic_payments
		resources :notebooks
	  resources :users
	  get 'signin', to: 'sessions#new'
	  post 'signin', to: 'sessions#create'
	  delete 'logout', to: 'sessions#destroy'
	end
end
