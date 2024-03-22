Rails.application.routes.draw do
  root to: 'home#index'
  post '/resultado', to: 'home#resultado'

  get '/sobre', to: 'home#sobre'
  get 'home/index', to: 'home#index'
  post '/index', to: 'home#index'

  post '/palavras', to: 'home#palavras'
  get '/palavras', to: 'home#palavras'

  post '/check_answer', to: 'home#check_answer'

  post '/work_random', to: 'home#work_random'

  get '/gerar_qr_code', to: 'home#gerar_qr_code'
  post '/gerar_qr_code', to: 'home#gerar_qr_code'

  get '/edit_word', to: 'home#edit_word'
  post '/edit_word', to: 'home#edit_word'

  get '/index2', to: 'home#index2'
  post '/index2', to: 'home#index2'

  get '/calculate_index2', to: 'home#calculate_index2'
  post '/calculate_index2', to: 'home#calculate_index2'

  get '/love_porce', to: 'home#love_porce'
  post '/love_porce', to: 'home#love_porce'

  get '/imc', to: 'home#imc'
  post '/imc', to: 'home#imc'

  get '/termo2', to: 'home#termo2'
  post '/termo2', to: 'home#termo2'
end
