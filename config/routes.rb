Rails.application.routes.draw do
  root to: 'home#index'
  post '/resultado', to: 'home#resultado'

  get '/sobre', to: 'home#sobre'
  get 'home/index', to: 'home#index'

  post '/palavras', to: 'home#palavras'
  get '/palavras', to: 'home#palavras'

  post '/check_answer', to: 'home#check_answer'
end
