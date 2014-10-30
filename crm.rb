require_relative 'contact'
require_relative 'rolodex'
require 'sinatra'

$rolodex= Rolodex.new
$rolodex.add_contact(Contact.new("Johnny", "Bravo", "johnny@bitmakerlabs.com", "Rockstar"))

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

get "/contacts/1000" do
  @contact = $rolodex.find_by_index(1000)
  erb :show_contact
end

post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
	$rolodex.add_contact(new_contact)
	redirect to('/contacts')
end
