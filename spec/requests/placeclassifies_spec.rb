require 'spec_helper'

describe "Placeclassifies" do
  describe "GET /placeclassifies" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get placeclassifies_path
      response.status.should be(200)
    end
  end
end
