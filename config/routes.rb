Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

  get '/images/:format/:path', to: 'images#show'

  get '/attentions', to: 'attentions#index'
  post '/attentions/query', to: 'attentions#query'
  delete '/attentions', to: 'attentions#destroy'

  get '/applications', to: 'applications#index'

  get '/queries', to: 'queries#index'
  post '/queries/select', to: 'queries#select_house'
  post '/queries/add_attention', to: 'queries#add_attention'
  delete '/queries/remove_attention', to: 'queries#remove_attention'

  get '/svgs/:path', to: 'svgs#show'

  get '/buildings', to: 'buildings#index'
  get '/buildings/:id', to: 'buildings#show', as: 'building'

  get '/sites', to: 'sites#index'
  get '/sites/:id', to: 'sites#show', as: 'site'

  get '/messages', to: 'messages#index'
  get '/messages/:id', to: 'messages#show', as: 'message'

  get '/house_types', to: 'house_types#index'
  get '/house_types/:id', to: 'house_types#show', as: 'type'

  get '/users/:id', to: 'users#show', as: 'user'

  get '/signin', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
end
