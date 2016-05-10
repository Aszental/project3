Rails.application.routes.draw do

get '/' => 'suburbs#index'
get '/api/suburbs' => 'api/suburbs#get_suburbs'

end
