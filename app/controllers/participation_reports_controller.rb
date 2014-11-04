class ParticipationReportsController < ApplicationController
  #before_action :set_participation_report, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user
  #before_action :correct_user , only: [:show, :destroy, :update, :edit]

  # GET /participation_reports
  # GET /participation_reports.json
  #def index
  #  @participation_reports = ParticipationReport.all
  #end

  # GET /participation_reports/1
  # GET /participation_reports/1.json
  #def show
  #end

  # GET /participation_reports/new
  def new
    @participation_report = current_user.participation_reports.build
  end

  # GET /participation_reports/1/edit
  #def edit
  #end

  # POST /participation_reports
  # POST /participation_reports.json
  def create
    @participation_report = current_user.participation_reports.build(participation_report_params)

    respond_to do |format|
      if @participation_report.save
        format.html { redirect_to @current_user, notice: 'Participation report was successfully submitted.' }
        format.json { render action: 'show', status: :created, location: @current_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @participation_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participation_reports/1
  # PATCH/PUT /participation_reports/1.json
  #def update
  #  respond_to do |format|
  #    if @participation_report.update(participation_report_params)
  #      format.html { redirect_to @participation_report, notice: 'Participation report was successfully updated.' }
  #      format.json { head :no_content }
  #    else
  #      format.html { render action: 'edit' }
  #      format.json { render json: @participation_report.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /participation_reports/1
  # DELETE /participation_reports/1.json
  # def destroy
  #   @participation_report.destroy
  #   respond_to do |format|
  #     format.html { redirect_to participation_reports_url }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
  #  def set_participation_report
  #    @participation_report = ParticipationReport.find(params[:id])
  #  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participation_report_params
      params.require(:participation_report).permit(:school_name,
                                            :school_population,
                                            :principal_name,
                                            :staff_name,
                                            :no_served_students_breakfast,
                                            :no_served_students_snack,
                                            :reporting_period_start,
                                            :reporting_period_end,
                                            :program_start_date,
                                            :no_volunteer_staff,
                                            :no_volunteer_students,
                                            :no_volunteer_community,
                                            :no_volunteer_parents,
                                            :food_donation_source,
                                            :financial_donation_source)
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
      redirect_to root_url if @phr.nil? unless  current_user.admin?
    end
end
