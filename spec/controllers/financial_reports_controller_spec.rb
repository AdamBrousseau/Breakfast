require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe FinancialReportsController do

  # This should return the minimal set of attributes required to create a valid
  # FinancialReport. As you add validations to FinancialReport, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FinancialReportsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all financial_reports as @financial_reports" do
      financial_report = FinancialReport.create! valid_attributes
      get :index, {}, valid_session
      assigns(:financial_reports).should eq([financial_report])
    end
  end

  describe "GET show" do
    it "assigns the requested financial_report as @financial_report" do
      financial_report = FinancialReport.create! valid_attributes
      get :show, {:id => financial_report.to_param}, valid_session
      assigns(:financial_report).should eq(financial_report)
    end
  end

  describe "GET new" do
    it "assigns a new financial_report as @financial_report" do
      get :new, {}, valid_session
      assigns(:financial_report).should be_a_new(FinancialReport)
    end
  end

  describe "GET edit" do
    it "assigns the requested financial_report as @financial_report" do
      financial_report = FinancialReport.create! valid_attributes
      get :edit, {:id => financial_report.to_param}, valid_session
      assigns(:financial_report).should eq(financial_report)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new FinancialReport" do
        expect {
          post :create, {:financial_report => valid_attributes}, valid_session
        }.to change(FinancialReport, :count).by(1)
      end

      it "assigns a newly created financial_report as @financial_report" do
        post :create, {:financial_report => valid_attributes}, valid_session
        assigns(:financial_report).should be_a(FinancialReport)
        assigns(:financial_report).should be_persisted
      end

      it "redirects to the created financial_report" do
        post :create, {:financial_report => valid_attributes}, valid_session
        response.should redirect_to(FinancialReport.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved financial_report as @financial_report" do
        # Trigger the behavior that occurs when invalid params are submitted
        FinancialReport.any_instance.stub(:save).and_return(false)
        post :create, {:financial_report => {  }}, valid_session
        assigns(:financial_report).should be_a_new(FinancialReport)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        FinancialReport.any_instance.stub(:save).and_return(false)
        post :create, {:financial_report => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested financial_report" do
        financial_report = FinancialReport.create! valid_attributes
        # Assuming there are no other financial_reports in the database, this
        # specifies that the FinancialReport created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        FinancialReport.any_instance.should_receive(:update).with({ "these" => "params" })
        put :update, {:id => financial_report.to_param, :financial_report => { "these" => "params" }}, valid_session
      end

      it "assigns the requested financial_report as @financial_report" do
        financial_report = FinancialReport.create! valid_attributes
        put :update, {:id => financial_report.to_param, :financial_report => valid_attributes}, valid_session
        assigns(:financial_report).should eq(financial_report)
      end

      it "redirects to the financial_report" do
        financial_report = FinancialReport.create! valid_attributes
        put :update, {:id => financial_report.to_param, :financial_report => valid_attributes}, valid_session
        response.should redirect_to(financial_report)
      end
    end

    describe "with invalid params" do
      it "assigns the financial_report as @financial_report" do
        financial_report = FinancialReport.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FinancialReport.any_instance.stub(:save).and_return(false)
        put :update, {:id => financial_report.to_param, :financial_report => {  }}, valid_session
        assigns(:financial_report).should eq(financial_report)
      end

      it "re-renders the 'edit' template" do
        financial_report = FinancialReport.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FinancialReport.any_instance.stub(:save).and_return(false)
        put :update, {:id => financial_report.to_param, :financial_report => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested financial_report" do
      financial_report = FinancialReport.create! valid_attributes
      expect {
        delete :destroy, {:id => financial_report.to_param}, valid_session
      }.to change(FinancialReport, :count).by(-1)
    end

    it "redirects to the financial_reports list" do
      financial_report = FinancialReport.create! valid_attributes
      delete :destroy, {:id => financial_report.to_param}, valid_session
      response.should redirect_to(financial_reports_url)
    end
  end

end