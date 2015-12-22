Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'users#index'

  def handle_options_request
    head(:ok) if request.request_method == "OPTIONS"
  end

  match '*path', :controller => 'application', :action => 'handle_options_request', :constraints => {:method => 'OPTIONS'}

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create', via: [:options]
  delete 'logout' => 'sessions#destroy'

  get 'home' => 'repleys#new'


  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  resources :memberships
  resources :groups
  resources :repleys
  resources :feeds
  resources :feeders
  resources :elements
  resources :selections
  resources :tags
  resources :participations
  resources :users
  resources :messages
  resources :answers
  resources :challenges
  resources :questions
  resources :ties
  # resources :stats


  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
