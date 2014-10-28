require_relative 'contact'
require_relative 'rolodex'
require 'sinatra'

$rolodex= Rolodex.new

#routes
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






# post '/contacts' do
# 	puts PARAMS: #{params}
# 	contact = Conact.new (params [:first_name], params[:last_name])
# 	$rolodex.add_contact(contact)
# 	redirect to('/contacts')
#end
