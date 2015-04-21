Rails.application.routes.draw do
  root 'welcome#index'

  get 'login'  => 'users#login'

  get 'register' => 'users#register'
  post 'auth' => 'users#auth'
  post 'register_center' => 'users#register_center'

  get 'logout' => 'users#logout'

  get 'users/setprofile' => 'users#setprofile'

  get 'users/changepassword' => 'users#changepassword'

  get 'users/confirmverifyemail/:id/:token' => 'users#confirmverifyemail'

  post 'users/confirmchangepassword' => 'users#confirmchangepassword'

  patch 'users/confirmchangeprofile'  => 'users#confirmchangeprofile'

  patch 'users/sendverifyemail' => 'users#sendverifyemail'

  patch 'users/confirmuploadpicture' => 'users#confirmuploadpicture'

  get 'users/verifyemail' => 'users#verifyemail'

  get 'users/setstatus/:id' => 'users#setstatus', as: :setstatus

  get 'products/setstatus/:id' => 'products#setstatus', as: :products_setstatus

  get 'users/uploadpicture' => 'users#uploadpicture'

  get 'show/:id' => 'welcome#show', as: :show

  get 'ask' => 'welcome#ask'

  get 'users/applyseller'  => 'users#applyseller'

  resources :information, only: [:new, :create]
  resources :products

  resources :information_users
  resources :user_products 
  
  resources :grades
  resources :majors

  resources :categories
  resources :users
  
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
end
