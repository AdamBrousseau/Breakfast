require "spec_helper"

describe ImmunizationsController do
  describe "routing" do

    it "routes to #index" do
      get("/phrs/1/immunizations").should route_to("immunizations#index", :phr_id => "1")
    end

    it "routes to #new" do
      get("/phrs/1/immunizations/new").should route_to("immunizations#new", :phr_id => "1")
    end

    it "routes to #show" do
      get("/phrs/1/immunizations/1").should route_to("immunizations#show", :id => "1", :phr_id => "1")
    end

    it "routes to #edit" do
      get("/phrs/1/immunizations/1/edit").should route_to("immunizations#edit", :id => "1", :phr_id => "1")
    end

    it "routes to #create" do
      post("/phrs/1/immunizations").should route_to("immunizations#create", :phr_id => "1")
    end

    it "routes to #update" do
      put("/phrs/1/immunizations/1").should route_to("immunizations#update", :id => "1", :phr_id => "1")
    end

    it "routes to #destroy" do
      delete("/phrs/1/immunizations/1").should route_to("immunizations#destroy", :id => "1", :phr_id => "1")
    end

  end
end
