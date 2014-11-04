require "spec_helper"

describe FinancialReportsController do
  describe "routing" do

    it "routes to #index" do
      get("/financial_reports").should route_to("financial_reports#index")
    end

    it "routes to #new" do
      get("/financial_reports/new").should route_to("financial_reports#new")
    end

    it "routes to #show" do
      get("/financial_reports/1").should route_to("financial_reports#show", :id => "1")
    end

    it "routes to #edit" do
      get("/financial_reports/1/edit").should route_to("financial_reports#edit", :id => "1")
    end

    it "routes to #create" do
      post("/financial_reports").should route_to("financial_reports#create")
    end

    it "routes to #update" do
      put("/financial_reports/1").should route_to("financial_reports#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/financial_reports/1").should route_to("financial_reports#destroy", :id => "1")
    end

  end
end
