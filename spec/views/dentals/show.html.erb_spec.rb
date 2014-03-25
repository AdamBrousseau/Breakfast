require 'spec_helper'

describe "dentals/show" do
  before(:each) do
    @dental = assign(:dental, stub_model(Dental,
      :dentist => "Dentist",
      :last_cleaning => "",
      :phr_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Dentist/)
    rendered.should match(//)
    rendered.should match(/1/)
  end
end
