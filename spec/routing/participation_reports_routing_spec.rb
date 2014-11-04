require "spec_helper"

describe ParticipationReportsController do
  describe "routing" do

    it "routes to #index" do
      get("/participation_reports").should route_to("participation_reports#index")
    end

    it "routes to #new" do
      get("/participation_reports/new").should route_to("participation_reports#new")
    end

    it "routes to #show" do
      get("/participation_reports/1").should route_to("participation_reports#show", :id => "1")
    end

    it "routes to #edit" do
      get("/participation_reports/1/edit").should route_to("participation_reports#edit", :id => "1")
    end

    it "routes to #create" do
      post("/participation_reports").should route_to("participation_reports#create")
    end

    it "routes to #update" do
      put("/participation_reports/1").should route_to("participation_reports#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/participation_reports/1").should route_to("participation_reports#destroy", :id => "1")
    end

  end
end
