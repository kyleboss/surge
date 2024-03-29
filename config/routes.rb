Rails.application.routes.draw do
  resources :barcode_trackable_pairings
  resources :barcodes
  resources :rfid_scans
  resources :rfid_reader_barcode_reader_pairings
  resources :rfid_readers
  resources :barcode_scans
  resources :barcode_readers
  resources :inventory_snapshot_contents
  resources :rfids
  resources :inventory_snapshots
  resources :antennas
  resources :departures
  resources :arrivals
  resources :trackables
  resources :patients
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'admin_panel/home'
  post 'patients/make_spotlight_search'
  post 'locations/filter_drugs_by_brand'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'admin', to: 'hospitals#show', as: 'admin'
  get 'trackables/refresh-timeline/:id', to: 'trackables#refresh_timeline'
  post 'pusher/auth'
  post 'scan_rfid', to: 'rfid_scans#scan_rfid', as: 'scan_rfid'
  post 'scan_barcode', to: 'barcode_scans#scan_barcode', as: 'scan_barcode'
  post 'make_inventory_snapshot', to: 'inventory_snapshots#make_inventory_snapshot', as: 'make_inventory_snapshot'

  resources :sessions, only: [:new, :create, :destroy]
  resources :locations
  resources :hospitals
  resources :users
  resources :addresses
  get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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


  root :to => "welcome#index"
end
