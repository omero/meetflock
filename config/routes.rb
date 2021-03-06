Antgrape::Application.routes.draw do
  mailboxes_for :users

  root :to => 'profiles#index'
  match 'privacy-policy' => 'profiles#policy', :as => "profiles"

  metropoli_for :cities, :states, :countries
  resources :coworker_requests
  resources :profiles
  # Override devise default routes for login, logout and signup
  devise_for :users do
    get '/login'   => "devise/sessions#new",       :as => :new_user_session
    post '/login'  => 'devise/sessions#create',    :as => :user_session
    get '/logout'  => 'devise/sessions#destroy',   :as => :destroy_user_session
    get "/signup"   => "devise/registrations#new",   :as => :new_user_registration
  end

  match 'create-fellowship' => 'fellowships#create', :as => "create_fellowship", :via => :post
  match 'update-fellowship' => 'fellowships#update', :as => "update_fellowship", :via => :post

  match 'looking-for' => 'coworker_requests#index', :as => "looking_for"

  match 'profile/:id' => 'profiles#show', :as => "my_profile"
  match 'edit-profile' => 'profiles#edit_profile', :as => "edit_profile"
  match 'step-1/:id' => 'profiles#step1', :as => "paso1"
  match 'step-2/:id' => 'profiles#step2', :as => "paso1"
  match '/' => 'profiles#index', :as => "profiles"



  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
