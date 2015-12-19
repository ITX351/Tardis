Tardis::Application.routes.draw do
  # devise_for :users, controllers: { sessions: "users/sessions" }
  devise_for :users, path: "/", path_names: 
  { sign_in: 'signin', sign_out: 'signout', registration: 'signup' }, 
  controllers: { sessions: "users/sessions", registrations: "users/registrations" }

  #get "static_pages/home"
  #get "static_pages/help"
  #get "static_pages/about"
  resources :comments
  # resources :users do
  #   resources :comments
  # end

  # resources :sessions, only: [:new, :create, :destroy]

  resources :places do
    resources :comments
    post "rate", on: :member
  end

  resources :users #user_path

  root :to => "static_pages#home"

  get '/' => 'static_pages#home'
  get '/help' => 'static_pages#help'
  get '/home' => 'static_pages#home'
  get '/about' => 'static_pages#about'
  #get '/help' => 'static_pages#help'

  # get '/signup' => 'users#new'
  # get '/signin' => 'users/sessions#new'
  # post '/signin' => 'users/sessions#create'
  # delete '/signout' => 'users/sessions#destroy'

  # devise_scope :user do
  #   get "signup", to: "devise/registrations#new"
  #   get "signin", to: "users/sessions#new"
  #   post "signin", to: "users/sessions#create"
  #   delete "signout", to: "users/sessions#destroy"
  # end

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
