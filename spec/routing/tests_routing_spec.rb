require "spec_helper"

describe TestsController do
  describe "routing" do

    it "routes to #index" do
      get("/phrs/1/tests").should route_to("tests#index", :phr_id => "1")
    end

    it "routes to #new" do
      get("/phrs/1/tests/new").should route_to("tests#new", :phr_id => "1")
    end

    it "routes to #show" do
      get("/phrs/1/tests/1").should route_to("tests#show", :phr_id => "1", :id => "1")
    end

    it "routes to #edit" do
      get("/phrs/1/tests/1/edit").should route_to("tests#edit", :phr_id => "1", :id => "1")
    end

    it "routes to #create" do
      post("/phrs/1/tests").should route_to("tests#create", :phr_id => "1")
    end

    it "routes to #update" do
      put("/phrs/1/tests/1").should route_to("tests#update", :phr_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      delete("/phrs/1/tests/1").should route_to("tests#destroy", :phr_id => "1", :id => "1")
    end

  end
end
