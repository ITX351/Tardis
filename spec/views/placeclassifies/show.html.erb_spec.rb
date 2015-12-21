require 'spec_helper'

describe "placeclassifies/show" do
  before(:each) do
    @placeclassify = assign(:placeclassify, stub_model(Placeclassify,
      :name1 => "Name1",
      :name2 => "Name2",
      :name3 => "Name3",
      :instruction => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name1/)
    rendered.should match(/Name2/)
    rendered.should match(/Name3/)
    rendered.should match(/MyText/)
  end
end
