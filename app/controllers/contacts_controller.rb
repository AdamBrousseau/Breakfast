class ContactsController < ApplicationController

	############################################################
  	#
  	#   Controller: Contacts
  	#   Associated Model: Contact
  	#   Purpose: This controller is responsible for all the
  	#             actions associated with the Contact model
  	#   Actions: index, new, create, show, edit, update, destroy
  	#
  	############################################################

  	# Before performing actions show, edit and update, ensure the user is
  	# signed_in and the correct_user is requesting the action.
	before_action :signed_in_user
	before_action :correct_user, only: [:show, :edit, :destroy, :update]

	# Action: index
  	# Purpose: Provide data for index view to list all contact records	   
  	# Functionality: If a search is performed, all contacts matching the 
  	# 				query are returned and paginated with 5 contacts per 
  	# 				page. If no contact matches the query, the available
  	#  				contacts are returned in an instance variable with a 
  	#  				message that no contacts were found. Also sends the 
  	# 				available data to ContactPdf class which is used to 
  	# 				generate PDF document for all the available contacts.
	def index
		if params[:search]
    		@contacts = current_user.contacts.paginate(page: params[:page], per_page: 5).find(:all, :conditions => ['name Like ?', "%#{params[:search]}%"])
    		if !@contacts.any?
    			flash[:failure] = "Contact Not Found"
    			@contacts = current_user.contacts.paginate(page: params[:page], per_page: 5)
    		end
  		else
  			@contacts = current_user.contacts.paginate(page: params[:page], per_page: 5)
  			respond_to do |format|
	     		format.html
	     		format.pdf do
	        		pdf = ContactPdf.new(current_user.contacts)
	        		send_data pdf.render, filename: "contact.pdf",
	                              		type: "application/pdf",
	                              		disposition: "inline"
				end
			end
  		end
	end

	# Action: show
  	# Purpose: Provide data to show view to render each individual contact.
  	# Functionality: Fetch the contact selected by the user from the databse into memory
  	# 				using the ID of the contact.
	def show
		@contact = current_user.contacts.find(params[:id])
	end

	# Action: new
  	# Purpose: This action creates an instance variable of the contact model
  	# 		  for the user that is currently active (logged in).
  	# Functionality: Create instance variable of the contact model.
	def new
		@contact = current_user.contacts.new
	end

	# Action: create
  	# Purpose: This action saves the instance variable of Contact to the database.
  	# Functionality: Try to save the contact. If there is a problem with the parameters,
  	#                redirect back to the new action, otherwise flash a success
  	#                message, and redirect to the newly saved contact.
	def create
		@contact = current_user.contacts.new(contact_params)
		
		if @contact.save
			flash[:success] = "New Contact Added"
			redirect_to @contact
		else
			render 'new'
		end
	end

	# Action: edit
	# Purpose: This action creates an instance variable of the contact model
	# 		  for the user that is currently active (logged in).
	# Functionality: Create instance variable of the contact model.
	def edit
		@contact = current_user.contacts.find(params[:id])
	end

	# Action: update
  	# Purpose: Update the contact attributes.
  	# Functionality: Try to update the contacts's details. If there is a problem with
  	#                the parameters, redirect back to the edit page, otherwise
  	#                flash a success message and redirect to the current contact's page.
	def update
		@contact = current_user.contacts.find(params[:id])

		if @contact.update(params[:contact].permit(:name, :phone1, :phone2, :email, :description))
			redirect_to @contact
		else
			render 'edit'
		end
	end

	# Action: destroy
  	# Purpose: Delete the contact from the Database
  	# Functionality: Destroy the Contact. Flash a success message. Redirect to the
  	#                index view for contacts
	def destroy
		@contact = current_user.contacts.find(params[:id])
		@contact.destroy
		flash[:success] = "Contact Deleted"
		redirect_to contacts_path
	end

	# Private Definitions
	private
		# contact_params
    	# These are the parameters permitted when submitting a request related
    	# to a Contact record. This protects against malicious HTTP requests trying to
    	# update a contact.
		def contact_params
			params.require(:contact).permit(:name, :phone1, :phone2, :email, :description)
		end

	# Before Filters

	# Check if the user is signed in.
	def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @contact = current_user.contacts.find_by(id: params[:id])
      redirect_to root_url if @contact.nil?
    end

end
