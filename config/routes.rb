Rails.application.routes.draw do
  root 'home#index'

  get 'denuns/new'

  get 'denuns/show_all'

  resources :denuns

  post 'denuns/like'

  post 'denuns/dislike'
end
