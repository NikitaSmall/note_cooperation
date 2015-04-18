NikitaOverflow::Application.routes.draw do

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  get 'statistic' => 'admin/statistic#index', as: 'statistic'
  get 'admin/users' => 'admin/statistic#user_statistic', as: 'user_statistic'
  get 'tags/:tag', to: 'questions#index', as: :tag

  devise_for :users
  root 'questions#index'

  resources :tags
  resources :questions
  put 'questions/rise/:id' => 'questions#raise_rating', as: 'raise_rating'
  put 'questions/down/:id' => 'questions#down_rating', as: 'down_rating'

  post 'answers' => 'answers#create'
  delete 'answer/:id' => 'answers#destroy', as: 'delete_answer'
  put 'answer/yes/:id' => 'answers#mark_answer_as_solution', as: 'answered'
  put 'answer/no/:id' => 'answers#unmark_answer_as_solution', as: 'not_answered'

  put 'answer/up/:id' => 'answers#up_rating', as: 'answer_up'
  put 'answer/down/:id' => 'answers#down_rating', as: 'answer_down'

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
