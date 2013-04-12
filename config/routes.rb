Bamlog::Application.routes.draw do

	match '/login', :to => "users#login", :via => [:get]
	match '/logout', :to => "users#logout", :via => [:get]
	match '/signin', :to => "users#signin", :via => [:post]
	
	resources :users
	resources :posts do
		member do
			get 'download'
			get 'download2'
		end
	end

  root :to => 'main#index'
end
