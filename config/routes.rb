Rails.application.routes.draw do
  devise_for :users

	devise_scope :user do
	  authenticated :user do
	    root 'todo_lists#index', as: :authenticated_root
	  end

	  unauthenticated do
	    root 'devise/sessions#new', as: :unauthenticated_root
	  end
	end

	resources :user, only: [] do
		resources :todo_lists, only: [:index, :show]
	end

	resources :todo_lists
end
