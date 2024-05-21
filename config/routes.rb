Rails.application.routes.draw do
  get 'ordinateurs/new'
  get 'emprunts/new'
  get 'sessions/destroy'
  get 'sessions/create'

  root 'main#index'
  get 'registrations/new'
  get 'main/new'
  get 'main/create'
  
  get 'login' , to: 'sessions#new'   # login_path 
  post "login" , to: "sessions#create" 
  get "logout", to: "sessions#destroy"
  get 'signup' , to: 'registrations#new'
  post "signup" , to: "registrations#create"

  resources :users do 
    collection do
      post 'search_by_id'
    end
  end
  resources :documents do 
    collection do
      #post 'index' , to: "documents#search_by_id"
      post 'search_by_id'
    end
  end
  resources :authors do
    collection do
      post 'search_by_id'
    end
  end
  resources :emprunts do 
    collection do
      post 'search_by_id'
    end
  end
  resources :ordinateurs do 
    collection do
      post 'search_by_id'
    end
  end
end
