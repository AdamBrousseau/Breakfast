require "spec_helper"

describe PhrsController do
  describe "routing" do

    it "routes to #index" do
      get("/phrs").should route_to("phrs#index")
    end

    it "routes to #new" do
      get("/phrs/new").should route_to("phrs#new")
    end

    it "routes to #show" do
      get("/phrs/1").should route_to("phrs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/phrs/1/edit").should route_to("phrs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/phrs").should route_to("phrs#create")
    end

    it "routes to #update" do
      put("/phrs/1").should route_to("phrs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/phrs/1").should route_to("phrs#destroy", :id => "1")
    end

  end
end
