require 'spec_helper'

describe "placeclassifies/new" do
  before(:each) do
    assign(:placeclassify, stub_model(Placeclassify,
      :name1 => "MyString",
      :name2 => "MyString",
      :name3 => "MyString",
      :instruction => "MyText"
    ).as_new_record)
  end

  it "renders new placeclassify form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", placeclassifies_path, "post" do
      assert_select "input#placeclassify_name1[name=?]", "placeclassify[name1]"
      assert_select "input#placeclassify_name2[name=?]", "placeclassify[name2]"
      assert_select "input#placeclassify_name3[name=?]", "placeclassify[name3]"
      assert_select "textarea#placeclassify_instruction[name=?]", "placeclassify[instruction]"
    end
  end
end
