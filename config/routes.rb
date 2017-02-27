Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get 'admin/show'

get '/' =>'users#index'

get '/show'=>'admin#show'

post '/create' => 'users#create'


post '/login' => 'users#login'

get '/logout' => 'users#logout'

# ***********LOGIN************
get '/dashboard' => "users#dashboard"

post '/users/:id' => 'admin#show'

# post '/destroy/dashboard/:id' => 'users#destroy_profile'

post '/destroy/dashboard/:id' => 'users#destroy_dashboard'

get '/add' => 'admin#add'

get '/show/:id' => 'admin#show'

get '/post/:id' => 'admin#post_detail'


get '/back' => 'admin#back'

post '/post_create' => 'users#post_create'

get '/users/:id' => 'admin#show'
#
post'/create_like/:id' => "users#create_like"
#
# post'/unlike/:id' => "users#unlike"

end
