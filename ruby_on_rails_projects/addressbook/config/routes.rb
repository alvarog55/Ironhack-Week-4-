Rails.application.routes.draw do
  get '/' => 'contacts#home'
  post '/contacts' => 'contacts#create'
  get '/contacts' => 'contacts#index'
  get '/contacts/new' => 'contacts#new'
  post '/contacts/favourites' => 'contacts#favourites'
  get '/contacts/:id' => 'contacts#show'

  

end
