class ContactsController < ApplicationController
	before_action :signed_in_user
	before_action :correct_user, only: [:show, :edit, :destroy, :update]

	
	def index
		#@contacts = current_user.contacts.paginate(page: params[:page], per_page: 10)
		@contacts = current_user.contacts.all
	end

	def show
		@contact = current_user.contacts.find(params[:id])
	end

	def new
		@contact = current_user.contacts.new
	end

	def create
		@contact = current_user.contacts.new(contact_params)
		
		if @contact.save
			flash[:success] = "New Contact Added"
			redirect_to @contact
		else
			render 'new'
		end
	end

	def edit
		@contact = current_user.contacts.find(params[:id])
	end

	def update
		@contact = current_user.contacts.find(params[:id])

		if @contact.update(params[:contact].permit(:name, :phone1, :phone2, :email, :description))
			redirect_to @contact
		else
			render 'edit'
		end
	end

	def destroy
		@contact = current_user.contacts.find(params[:id])
		@contact.destroy
		flash[:success] = "Contact Deleted"
		redirect_to contacts_path
	end

	private
		def contact_params
			params.require(:contact).permit(:name, :phone1, :phone2, :email, :description)
		end

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
