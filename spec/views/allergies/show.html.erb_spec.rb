require 'spec_helper'

describe "allergies/show" do
  before(:each) do
    @allergy = assign(:allergy, stub_model(Allergy,
      :allergy_name => "Allergy Name",
      :allergy_description => "Allergy Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Allergy Name/)
    rendered.should match(/Allergy Description/)
  end
end
