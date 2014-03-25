require "spec_helper"

describe AppointmentsController do
  describe "routing" do

    it "routes to #index" do
      get("/phrs/1/appointments").should route_to("appointments#index", :phr_id => "1")
    end

    it "routes to #new" do
      get("/phrs/1/appointments/new").should route_to("appointments#new", :phr_id => "1")
    end

    it "routes to #show" do
      get("/phrs/1/appointments/1").should route_to("appointments#show", :id => "1", :phr_id => "1")
    end

    it "routes to #edit" do
      get("/phrs/1/appointments/1/edit").should route_to("appointments#edit", :id => "1", :phr_id => "1")
    end

    it "routes to #create" do
      post("/phrs/1/appointments").should route_to("appointments#create", :phr_id => "1")
    end

    it "routes to #update" do
      put("/phrs/1/appointments/1").should route_to("appointments#update", :id => "1", :phr_id => "1")
    end

    it "routes to #destroy" do
      delete("/phrs/1/appointments/1").should route_to("appointments#destroy", :id => "1", :phr_id => "1")
    end

  end
end
