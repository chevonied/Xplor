Rails.application.routes.draw do
  resources :places
  resources :places
  resources :subleases
  resources :rentals
  resources :feedbacks, only: [:new, :create] # we only need these two since we could always email back sender
  devise_for :users
  
  authenticated :user do
    root 'users#show', :as => :authenticated_root
  end
  
  resources :conversations do
    resources :messages
  end
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#index', as: 'home'

  # Example of regular route:
  get 'about' => 'pages#about', as: 'about'
  get 'rental_options' => 'pages#rental_options', as: 'rental_options'
  get 'sublease_options' => 'pages#sublease_options', as: 'sublease_options'
  get 'feedback' => 'pages#feedback', as: 'feedback'
  get 'show' => 'posts#show', as: 'show'
  
  get 'priv_r_index' => 'rentals#priv_r_index', as: 'priv_r_index'
  get 'priv_s_index' => 'subleases#priv_s_index', as: 'priv_s_index'
  

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  resources :pages, :users

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
