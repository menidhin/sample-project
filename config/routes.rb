Rails.application.routes.draw do
  devise_for :users
	#root to: "posts#index"
  
  resources :products, :categories, :customers, :product_images, :sellers, :reviews
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get "/products" => "products#index"
  get "/categories" => "categories#index"
 	get "/customers" => "customers#index"
 	get "/sellers" => "sellers#index"
 	get "/users" => "users#index"
 	get '/edit-product-image/:product_id/:id' => 'product_images#edit', :via => :get, :as => :edit_cutome_product_image
 	get '/new-product-image/:product_id' => 'product_images#new', :via => :get, :as => :new_cutome_product_image
 	get '/edit-review/:product_id/:id' => 'reviews#edit', :via => :get, :as => :edit_custome_review
 	get '/new-review/:product_id' => 'reviews#new', :via => :get, :as => :new_custome_review
 	match '/save-review' => 'ajax#save_review', :via => :post, :as => :save_review
 	
end
