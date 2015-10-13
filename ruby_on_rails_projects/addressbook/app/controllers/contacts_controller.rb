class ContactsController < ApplicationController
	def index
		@contacts = Contact.order_alph
	end
	def show
		id = params[:id]
		@contact = Contact.find(id)
		if @contact.nil?
			render :no_contact_found
		else
			render :show
		end	
	end

	def create 
		@contact = Contact.new(contact_params)
		if @contact.save
			redirect_to "/contacts/#{@contact.id}"
		else
			render :new
		end
	end

	def new
		@contact = Contact.new
		render :new
	end

	def contact_params
		params.require(:contact).permit(:name, :address, :phone_number, :email, :favourites)
	end

	def favourites
		#@contact = Contact.find(favourites)
		@id = params[:parent_id]
		contact = Contact.find(@id)
		contact.update_attribute(:favourites, true)
		render :favourites
	end


end
