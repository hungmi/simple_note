Rails.application.routes.draw do
  get '/', to: redirect('/admin')
  get '/service-worker.js' => "service_workers#service_worker"
  get '/manifest.json' => "service_workers#manifest"
  get '/offline.html' => "service_workers#offline"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	namespace :admin do
		root "payments#index"
		resources :payments do
			get "summary", on: :collection
		end
		resources :projects
		resources :periodic_payments
		resources :notebooks
	  resources :users
	  get 'signin', to: 'sessions#new'
	  post 'signin', to: 'sessions#create'
	  delete 'logout', to: 'sessions#destroy'
	end
end
