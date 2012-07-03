require "spec_helper"

describe DummyRecordsController do
  describe "routing" do

    it "routes to #index" do
      get("/dummy_records").should route_to("dummy_records#index")
    end

    it "routes to #new" do
      get("/dummy_records/new").should route_to("dummy_records#new")
    end

    it "routes to #show" do
      get("/dummy_records/1").should route_to("dummy_records#show", :id => "1")
    end

    it "routes to #edit" do
      get("/dummy_records/1/edit").should route_to("dummy_records#edit", :id => "1")
    end

    it "routes to #create" do
      post("/dummy_records").should route_to("dummy_records#create")
    end

    it "routes to #update" do
      put("/dummy_records/1").should route_to("dummy_records#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/dummy_records/1").should route_to("dummy_records#destroy", :id => "1")
    end

  end
end
