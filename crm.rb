require_relative 'contact'
require_relative 'rolodex'
require 'sinatra'
require "pry"

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

get "/contacts/:id" do
	@contact = $rolodex.find_by_index(params[:id].to_i)
	if @contact
		erb :show_contact
	else
		raise Sinatra::NotFound
	end
end

get "/contacts/:id/edit" do
	@contact = $rolodex.find_by_index(params[:id].to_i)
	if @contact
		erb :edit_contact
	else
		raise Sinatra::NotFound
	end
end

put "/contacts/:id" do
	@contact = $rolodex.find_by_index(params[:id].to_i)
	if @contact
		@contact.first_name = params[:first_name]
		@contact.last_name = params[:last_name]
		@contact.email = params[:email]
		@contact.note = params[:note]

		redirect to("/contacts")
	else
		raise Sinatra::NotFound
	end
end

delete "/contacts/:id" do
	@contact = $rolodex.find_by_index(params[:id].to_i)
	if @contact
		$rolodex.delete_contact(@contact)
		redirect to("/contacts")
	else
		raise Sinatra::NotFound
	end
end


post '/contacts' do
	new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
	$rolodex.add_contact(new_contact)
	redirect to('/contacts')
end
