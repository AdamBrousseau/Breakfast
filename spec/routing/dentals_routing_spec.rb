require "spec_helper"

describe DentalsController do
  describe "routing" do

    it "routes to #index" do
      get("/dentals").should route_to("dentals#index")
    end

    it "routes to #new" do
      get("/dentals/new").should route_to("dentals#new")
    end

    it "routes to #show" do
      get("/dentals/1").should route_to("dentals#show", :id => "1")
    end

    it "routes to #edit" do
      get("/dentals/1/edit").should route_to("dentals#edit", :id => "1")
    end

    it "routes to #create" do
      post("/dentals").should route_to("dentals#create")
    end

    it "routes to #update" do
      put("/dentals/1").should route_to("dentals#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/dentals/1").should route_to("dentals#destroy", :id => "1")
    end

  end
end
