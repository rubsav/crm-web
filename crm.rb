require_relative 'contact'
require 'sinatra'

get '/' do
	@rubens_crm = "Ruben's CRM App"
	erb :index
end

get '/contacts' do
	@contacts = []
	erb :contacts
end

get '/contacts/new' do 
	erb :new_contact
end

# require './rolodex'

# $rolodex = Rolodex.new



# post '/contacts' do
# 	puts PARAMS: #{params}
# 	contact = Conact.new (params [:first_name], params[:last_name])
# 	$rolodex.add_contact(contact)
# 	redirect to('/contacts')
#end
