require 'spec_helper'

describe "allergies/new" do
  before(:each) do
    assign(:allergy, stub_model(Allergy,
      :allergy_name => "MyString",
      :allergy_description => "MyString"
    ).as_new_record)
  end

  it "renders new allergy form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", allergies_path, "post" do
      assert_select "input#allergy_allergy_name[name=?]", "allergy[allergy_name]"
      assert_select "input#allergy_allergy_description[name=?]", "allergy[allergy_description]"
    end
  end
end
