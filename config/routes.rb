Fanfollow::Application.routes.draw do
  root :to => "home#landingpage"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users

  #Omniauth stuff!
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'logout', to:'sessions#destroy'
  
  resources :events

end