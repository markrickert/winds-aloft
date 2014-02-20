WindsAloft::Application.routes.draw do

  # You can have the root of your site routed with "root"
  # root 'winds#index'

  resources :stations, only: [:index]
  resources :winds, only: [:index]

end
