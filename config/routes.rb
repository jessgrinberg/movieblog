Rails.application.routes.draw do
  #get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # get 'movies/:movie_id/reviews' => 'reviews#index'
  # get 'movies/:movie_id/reviews/new' => 'reviews#new', as: :new_review
  # get 'movies/:movie_id/reviews/:id' => 'reviews#show', as: :review
  # post 'movies/:movie_id/reviews' => 'reviews#create'
  # get 'movies/:movie_id/reviews/:id/edit' => 'reviews#edit', as: :edit_review
  # patch 'movies/:movie_id/reviews/:id' => 'reviews#update'
  # put 'movies/:movie_id/reviews/:id' => 'reviews#update'
  # delete 'movies/:movie_id/reviews/:id' => 'reviews#destroy'

  #get 'home' => 'movies#home'

  # get 'movies/' => 'movies#index'
  # get 'movies/new' => 'movies#new', as: :new_movie
  # get 'movies/:id' => 'movies#show', as: :movie
  # post 'movies/' => 'movies#create'
  # get 'movies/:id/edit' => 'movies#edit', as: :edit_movie
  # patch 'movies/:id' => 'movies#update'
  # delete 'movies/:id' => 'movies#destroy'

  resources :movies do
  resources :reviews
  end



#      movie_reviews GET    /movies/:movie_id/reviews(.:format)          reviews#index
#                   POST   /movies/:movie_id/reviews(.:format)          reviews#create
#  new_movie_review GET    /movies/:movie_id/reviews/new(.:format)      reviews#new
# edit_movie_review GET    /movies/:movie_id/reviews/:id/edit(.:format) reviews#edit
#      movie_review GET    /movies/:movie_id/reviews/:id(.:format)      reviews#show
#                   PATCH  /movies/:movie_id/reviews/:id(.:format)      reviews#update
#                   PUT    /movies/:movie_id/reviews/:id(.:format)      reviews#update
#                   DELETE /movies/:movie_id/reviews/:id(.:format)      reviews#destroy
#            movies GET    /movies(.:format)                            movies#index
#                   POST   /movies(.:format)                            movies#create
#         new_movie GET    /movies/new(.:format)                        movies#new
#        edit_movie GET    /movies/:id/edit(.:format)                   movies#edit
#             movie GET    /movies/:id(.:format)                        movies#show
#                   PATCH  /movies/:id(.:format)                        movies#update
#                   PUT    /movies/:id(.:format)                        movies#update
#                   DELETE /movies/:id(.:format)                        movies#destroy


  get "users" => "welcome#index"
  get "users/new" => "users#new"
  post "users" => "users#create"

  get '/login'     => 'sessions#new'
  post '/login'    => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

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
