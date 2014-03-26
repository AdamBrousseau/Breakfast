require 'spec_helper'

describe "allergies/edit" do
  before(:each) do
    @allergy = assign(:allergy, stub_model(Allergy,
      :allergy_name => "MyString",
      :allergy_description => "MyString"
    ))
  end

  it "renders the edit allergy form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", allergy_path(@allergy), "post" do
      assert_select "input#allergy_allergy_name[name=?]", "allergy[allergy_name]"
      assert_select "input#allergy_allergy_description[name=?]", "allergy[allergy_description]"
    end
  end
end
