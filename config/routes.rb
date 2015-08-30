Rails.application.routes.draw do

  get '/research-query' => 'application#fetch_query'

end
