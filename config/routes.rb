WindsAloft::Application.routes.draw do

  root to: 'winds#index'

  resources :stations, only: [:index]
  resources :winds, only: [:index]

end
