Rails.application.routes.draw do
  get 'users/info'

  get 'auth', to: 'authentication#local'
  post 'auth', to: 'authentication#authenticate'
  get 'auth/error', to: 'authentication#error'

  namespace :admin do
    resources :users, only: %i(index new create)
  end
end
