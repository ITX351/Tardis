require "spec_helper"

describe PlaceclassifiesController do
	describe "routing" do

		it "routes to #index" do
			get("/placeclassifies").should route_to("placeclassifies#index")
		end

		it "routes to #new" do
			get("/placeclassifies/new").should route_to("placeclassifies#new")
		end

		it "routes to #show" do
			get("/placeclassifies/1").should route_to("placeclassifies#show", :id => "1")
		end

		it "routes to #edit" do
			get("/placeclassifies/1/edit").should route_to("placeclassifies#edit", :id => "1")
		end

		it "routes to #create" do
			post("/placeclassifies").should route_to("placeclassifies#create")
		end

		it "routes to #update" do
			put("/placeclassifies/1").should route_to("placeclassifies#update", :id => "1")
		end

		it "routes to #destroy" do
			delete("/placeclassifies/1").should route_to("placeclassifies#destroy", :id => "1")
		end

	end
end
