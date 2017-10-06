Rails.application.routes.draw do

  get  'pages/dashboard', to: 'pages#dashboard'
  post 'pages/:user_id/admin', to: 'pages#admin', as: 'admin'
  post 'pages/:user_id/visitor', to: 'pages#visitor', as: 'visitor'

	resources :posts do
		resources :comments, only: [:create, :destroy]
	end

	devise_for :users, controllers: {
		sessions: 'users/sessions',
		registrations: 'users/registrations'
	}
	root 'posts#index'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
