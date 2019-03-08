Rails.application.routes.draw do
  get 'admin', to: redirect('/admin/users')
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
namespace :admin do
		resources :users
  resources :users
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
end
