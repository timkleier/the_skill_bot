Rails.application.routes.draw do
  root to: 'pages#home'
  get :temp, controller: :pages
  get :search, controller: :pages
end
