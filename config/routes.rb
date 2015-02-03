Rails.application.routes.draw do
  devise_for :users
  root 'todo_lists#index'

  get 'todo_lists/my_todos' => 'todo_lists#my_todos'

  resources :todo_lists do
    resources :list_item, as: :item
  end

  get 'favorites' => 'favorite_todos#index'
  put 'favorite/:id' => 'favorite_todos#favorite', as: :my_favorite

  get '/:user_id/feed' => 'feeds#show', as: :feed

end
