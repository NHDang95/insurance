Rails.application.routes.draw do
	root "static_pages#home"
	get 'static_pages/about'
	get 'static_pages/fee'	
	get 'static_pages/rights'		
	get "/static_pages/:page" => "statc_pages#show"  
  namespace :admin do
    resources :users, only: [:index]
    resources :articles 
    resources :types, only: [:new, :create, :edit, :update, :destroy]
    resources :brands, only: [:index, :edit, :update, :destroy] do
      resources :types, only: [:update]
    end
    get "/dashboard", to: "dashboards#index"
  end        
	scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users
  	resources :articles, only: [:index, :show]				
   	resources :products, only: [:index, :show]	  	  		   	
    resources :articles, only: [:index, :show]  
    resources :products, only: [:index, :show] do
      member do 
        post :sendmail
      end
    end      
	end
	match "*.path", to: redirect("/#{I18n.default_locale}/%{path}"), :via => [:get, :post]
  match "", to: redirect("/#{I18n.default_locale}"), :via => [:get, :post]
  match "*path" => redirect("/"), via: :get
	get "search(/:search)", to: "searches#index", as: :search
end
