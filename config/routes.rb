Rails.application.routes.draw do
  get 'users/info'

  get 'auth/facebook', to: 'authentication#facebook'
  get 'auth/facebook/return', to: 'authentication#facebook_return'
end
