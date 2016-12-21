Rails.application.routes.draw do
  get 'users/info'

  get 'auth/facebook', to: 'authentication#facebook'
  get 'auth/facebook/return', to: 'authentication#facebook_return'
  get 'auth', to: 'authentication#local'
  post 'auth', to: 'authentication#authenticate'
  get 'auth/error', to: 'authentication#error'
end
