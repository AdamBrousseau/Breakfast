require "spec_helper"

describe EyesController do
  describe "routing" do

    it "routes to #index" do
      get("/phrs/1/eyes").should route_to("eyes#index", :phr_id => "1")
    end

    it "routes to #new" do
      get("/phrs/1/eyes/new").should route_to("eyes#new", :phr_id => "1")
    end

    it "routes to #show" do
      get("/phrs/1/eyes/1").should route_to("eyes#show", :phr_id => "1", :id => "1")
    end

    it "routes to #edit" do
      get("/phrs/1/eyes/1/edit").should route_to("eyes#edit", :phr_id => "1", :id => "1")
    end

    it "routes to #create" do
      post("/phrs/1/eyes").should route_to("eyes#create", :phr_id => "1")
    end

    it "routes to #update" do
      put("/phrs/1/eyes/1").should route_to("eyes#update", :phr_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      delete("/phrs/1/eyes/1").should route_to("eyes#destroy", :phr_id => "1", :id => "1")
    end

  end
end
