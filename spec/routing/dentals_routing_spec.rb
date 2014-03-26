require "spec_helper"

describe DentalsController do
  describe "routing" do

    it "routes to #index" do
      get("/phrs/1/dentals").should route_to("dentals#index", :phr_id => "1")
    end

    it "routes to #new" do
      get("/phrs/1/dentals/new").should route_to("dentals#new", :phr_id => "1")
    end

    it "routes to #show" do
      get("/phrs/1/dentals/1").should route_to("dentals#show", :id => "1", :phr_id => "1")
    end

    it "routes to #edit" do
      get("/phrs/1/dentals/1/edit").should route_to("dentals#edit", :id => "1", :phr_id => "1")
    end

    it "routes to #create" do
      post("/phrs/1/dentals").should route_to("dentals#create", :phr_id => "1")
    end

    it "routes to #update" do
      put("/phrs/1/dentals/1").should route_to("dentals#update", :id => "1", :phr_id => "1")
    end

    it "routes to #destroy" do
      delete("/phrs/1/dentals/1").should route_to("dentals#destroy", :id => "1", :phr_id => "1")
    end

  end
end
