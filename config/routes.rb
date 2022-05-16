Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/new', to: 'games#new'

  # Generic syntax:
  # verb 'path', to: 'controller#action'
  post '/score', to: 'games#score'

end
