require 'sinatra'

get '/' do
	@rubens_crm = "Ruben's CRM App"
	erb :index
end



# require './contact'
# require './rolodex'
# require 'sinatra'

# $rolodex = Rolodex.new


# end
# get '/contacts' do
# 	@contacts = []
# 	erb :contacts
# end

# get '/contacts/new' do 
# 	erb :new_contact
# end

# post '/contacts' do
# 	puts PARAMS: #{params}
# 	contact = Conact.new (params [:first_name], params[:last_name])
# 	$rolodex.add_contact(contact)
# 	redirect to('/contacts')
#end
