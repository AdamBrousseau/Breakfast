class FinancialReportsController < ApplicationController
  #before_action :set_financial_report, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user

  # GET /financial_reports
  # GET /financial_reports.json
  #def index
  #  @financial_reports = FinancialReport.all
  #end

  # GET /financial_reports/1
  # GET /financial_reports/1.json
  #def show
  #end

  # GET /financial_reports/new
  def new
    @financial_report = current_user.financial_reports.build
  end

  # GET /financial_reports/1/edit
  #def edit
  #end

  # POST /financial_reports
  # POST /financial_reports.json
  def create
    @financial_report = current_user.financial_reports.build(financial_report_params)

    respond_to do |format|
      if @financial_report.save
        format.html { redirect_to @current_user, notice: 'Financial report was successfully submitted.' }
        format.json { render action: 'show', status: :created, location: @current_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @financial_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /financial_reports/1
  # PATCH/PUT /financial_reports/1.json
  # def update
  #   respond_to do |format|
  #     if @financial_report.update(financial_report_params)
  #       format.html { redirect_to @financial_report, notice: 'Financial report was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: 'edit' }
  #       format.json { render json: @financial_report.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /financial_reports/1
  # DELETE /financial_reports/1.json
  # def destroy
  #   @financial_report.destroy
  #   respond_to do |format|
  #     format.html { redirect_to financial_reports_url }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_financial_report
    #  @financial_report = FinancialReport.find(params[:id])
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    def financial_report_params
      params.require(:financial_report).permit(:school_name,
                                              :month_of_report,
                                              :total_spent,
                                              :comments)
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    # def correct_user
    #   @phr = current_user.phrs.find_by(id: params[:id])
    #   redirect_to root_url if @phr.nil? unless  current_user.admin?
    # end
end
