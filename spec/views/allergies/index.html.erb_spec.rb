require 'spec_helper'

describe "allergies/index" do
  before(:each) do
    assign(:allergies, [
      stub_model(Allergy,
        :allergy_name => "Allergy Name",
        :allergy_description => "Allergy Description"
      ),
      stub_model(Allergy,
        :allergy_name => "Allergy Name",
        :allergy_description => "Allergy Description"
      )
    ])
  end

  it "renders a list of allergies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Allergy Name".to_s, :count => 2
    assert_select "tr>td", :text => "Allergy Description".to_s, :count => 2
  end
end
