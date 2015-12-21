require 'spec_helper'

describe "placeclassifies/edit" do
  before(:each) do
    @placeclassify = assign(:placeclassify, stub_model(Placeclassify,
      :name1 => "MyString",
      :name2 => "MyString",
      :name3 => "MyString",
      :instruction => "MyText"
    ))
  end

  it "renders the edit placeclassify form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", placeclassify_path(@placeclassify), "post" do
      assert_select "input#placeclassify_name1[name=?]", "placeclassify[name1]"
      assert_select "input#placeclassify_name2[name=?]", "placeclassify[name2]"
      assert_select "input#placeclassify_name3[name=?]", "placeclassify[name3]"
      assert_select "textarea#placeclassify_instruction[name=?]", "placeclassify[instruction]"
    end
  end
end
