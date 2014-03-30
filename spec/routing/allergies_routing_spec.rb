require "spec_helper"

describe AllergiesController do
  describe "routing" do

    it "routes to #index" do
      get("/phrs/1/allergies").should route_to("allergies#index", :phr_id => "1")
    end

    it "routes to #new" do
      get("/phrs/1/allergies/new").should route_to("allergies#new", :phr_id => "1")
    end

    it "routes to #show" do
      get("/phrs/1/allergies/1").should route_to("allergies#show", :id => "1", :phr_id => "1")
    end

    it "routes to #edit" do
      get("/phrs/1/allergies/1/edit").should route_to("allergies#edit", :id => "1", :phr_id => "1")
    end

    it "routes to #create" do
      post("/phrs/1/allergies").should route_to("allergies#create", :phr_id => "1")
    end

    it "routes to #update" do
      put("/phrs/1/allergies/1").should route_to("allergies#update", :id => "1", :phr_id => "1")
    end

    it "routes to #destroy" do
      delete("/phrs/1/allergies/1").should route_to("allergies#destroy", :id => "1", :phr_id => "1")
    end

  end
end
