require_relative 'contact'
require_relative 'rolodex'
require 'sinatra'

get '/' do
	@rubens_crm = "Ruben's CRM App"
	erb :index
end

get '/contacts' do
	@contacts = []
	@contacts << Contact.new("Julie", "Hache", "julie@bitmakerlabs.com", "Instructor")
	@contacts << Contact.new("Will", "Richman", "will@bitmakerlabs.com", "Co-Founder")
	@contacts << Contact.new("Chris", "Johnston", "chris@bitmakerlabs.com", "Instructor")

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
