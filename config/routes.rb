Rails.application.routes.draw do
  root 'landing#index'
  get '/callback', to: 'landing#callback'
end
