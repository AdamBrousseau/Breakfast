class PhrsController < ApplicationController
	before_action :signed_in_user, only: [:index, :show, :edit, :update, :destroy]
  	before_action :correct_user,   only: [:index, :show, :edit, :update, :destroy]
  
  def index
  	@phrs = User.phrs.paginate(page: params[:page])
  end

  def show
    @phr = User.phr.find(params[:id])
  end

  def new
  end

  def destroy
    User.phrs.find(params[:id]).destroy
    flash[:success] = "PHR deleted."
  end

  # Before filters

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end