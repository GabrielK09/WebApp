Rails.application.routes.draw do
  root to: 'home#index'
  post '/resultado', to: 'home#resultado'
  post '/menos', to: 'home#menos'
  post '/mult', to: 'home#mult'

end
