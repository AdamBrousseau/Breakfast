class PhrsController < ApplicationController
	before_action :signed_in_user
  before_action :correct_user, only: [:index, :show, :destroy, :edit]
  
  def index
  	@phrs = User.phrs.paginate(page: params[:page])
  end

  def show
    @phr = current_user.phrs.find(params[:id])
  end

  def create
    @phr = current_user.phrs.build(phr_params)
    if @phr.save
      flash[:success] = "PHR Created!"
      redirect_to @phr
    else
      render 'new'
    end
  end



  def new
    @phr = current_user.phrs.build
  end

  def edit
  end

  def update
    @phr = current_user.phrs.find(params[:id])
    if @phr.update_attributes(phr_params)
      flash[:success] = "PHR updated"
      redirect_to @phr
    else
      render 'edit'
    end
  end

  def destroy
    @phr.destroy
    flash[:success] = "PHR deleted."
    redirect_back_or @phr 

  end

  private

    def phr_params
      params.require(:phr).permit(:first_name,
                                  :last_name,
                                  :date_of_birth,
                                  :gender,
                                  :blood_type,
                                  :health_card_no)
    end

  # Before filters

  def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @phr = current_user.phrs.find_by(id: params[:id])
      redirect_to root_url if @phr.nil?
    end
    
end