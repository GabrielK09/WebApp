Rails.application.routes.draw do
  root to: 'home#index'
  post '/resultado', to: 'home#resultado'

  get '/sobre', to: 'home#sobre'
  get 'home/index', to: 'home#index'

  get '/advinhar', to: 'home#advinhar'
  post 'home/advinhar', to: 'home#advinhar'

  post '/palavras', to: 'home#palavras'
  get '/palavras', to: 'home#palavras'
end
