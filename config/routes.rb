Rails.application.routes.draw do
  resources :comments
  devise_for :users
  get 'links/index'

  resources :links do
    member do
      get:delete
      put "like" ,   to: "links#upvote"
      put "dislike", to: "links#downvote"
    end
    resources :comments
  end

  root 'links#index'

  get 'links/show'

  get 'links/new'

  get 'links/create'

  get 'links/edit'

  get 'links/update'

  get 'links/delete'

  get 'links/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
