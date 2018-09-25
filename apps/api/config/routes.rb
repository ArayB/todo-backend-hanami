# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
post '/', to: 'todos#create'
get '/', to: 'todos#index'
delete '/:id', to: 'todos#destroy'
delete '/', to: 'todos#destroy_all'
get '/:id', to: 'todos#show', as: :todo
