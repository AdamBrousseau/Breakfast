require "spec_helper"

describe AilmentsController do
  describe "routing" do

    it "routes to #index" do
      get("/phrs/1/ailments").should route_to("ailments#index", :phr_id => "1")
    end

    it "routes to #new" do
      get("/phrs/1/ailments/new").should route_to("ailments#new", :phr_id => "1")
    end

    it "routes to #show" do
      get("/phrs/1/ailments/1").should route_to("ailments#show", :phr_id => "1", :id => "1")
    end

    it "routes to #edit" do
      get("/phrs/1/ailments/1/edit").should route_to("ailments#edit", :phr_id => "1", :id => "1")
    end

    it "routes to #create" do
      post("/phrs/1/ailments").should route_to("ailments#create", :phr_id => "1")
    end

    it "routes to #update" do
      put("/phrs/1/ailments/1").should route_to("ailments#update", :phr_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      delete("/phrs/1/ailments/1").should route_to("ailments#destroy", :phr_id => "1", :id => "1")
    end

  end
end
