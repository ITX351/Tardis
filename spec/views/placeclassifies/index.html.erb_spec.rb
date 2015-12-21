require 'spec_helper'

describe "placeclassifies/index" do
  before(:each) do
    assign(:placeclassifies, [
      stub_model(Placeclassify,
        :name1 => "Name1",
        :name2 => "Name2",
        :name3 => "Name3",
        :instruction => "MyText"
      ),
      stub_model(Placeclassify,
        :name1 => "Name1",
        :name2 => "Name2",
        :name3 => "Name3",
        :instruction => "MyText"
      )
    ])
  end

  it "renders a list of placeclassifies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name1".to_s, :count => 2
    assert_select "tr>td", :text => "Name2".to_s, :count => 2
    assert_select "tr>td", :text => "Name3".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
