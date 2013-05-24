SpWebapp::Application.routes.draw do

  root :to => 'sessions#new'
  
  resources :users
  match '/signup',  to: 'users#new'
  match '/profile', to: 'users#show'
  match '/dashboard/disorders/search', to: 'users#search_disorders'
  match '/dashboard/disorders/:cui', to: 'users#find_a_disorder'
  match '/treatments/search', to: 'users#search_treatments'
  match '/prescriptions/:cui', to: 'users#find_prescriptions_for_disorder'
  match '/prescriptions', to: 'users#add_prescription'

  #resources :disorders
  match 'disorders', to: "disorders#index"
  get "disorders/new"
  post "disorders/new", to: 'disorders#create'

  resources :sessions, only: [:new, :create, :destroy]
  match '/login',  to: 'sessions#new'
  match '/logout', to: 'sessions#destroy'

  match '/dashboard', to: 'admin#index', via: 'get'

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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
