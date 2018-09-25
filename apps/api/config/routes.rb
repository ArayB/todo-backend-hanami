# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
post '/', to: 'todos#create'
get '/', to: 'todos#index'
delete '/:id', to: 'todos#destroy'
