Rails.application.routes.draw do

  root 'application#home'
  get '/research-query' => 'application#fetch_query'

end
