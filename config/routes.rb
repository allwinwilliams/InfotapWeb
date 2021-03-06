Rails.application.routes.draw do

  #resources :feeds
  #resources :departments
  get 'admin/Index'
  get 'pages/index'
  root 'pages#index'
  devise_for :admins
  devise_for :users
  get 'user/departments/:id/feeds'=> 'user/departments#show_feeds', as: :user_show_feeds
  get 'admin/departments/:id/feeds'=> 'admin/departments#show_feeds', as: :admin_show_feeds
  get 'admin/users'=> 'admin/users#index', as: :admin_users
  get 'admin/users/:id'=> 'admin/users#show', as: :admin_user

  get 'user/user-feeds'=> 'user/departments_users#index', as: :department_user_feeds
  post 'user/departments/subscribe'=> 'user/departments_users#subscribe', as: :department_user_subscribe
  post 'user/departments/unsubscribe'=> 'user/departments_users#unsubscribe', as: :department_user_unsubscribe
  namespace :admin do
    resources :feeds
    resources :departments
  end
  namespace :user do
    resources :feeds
    resources :departments

  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


  # Example of regular route:
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
