require 'spec_helper'

describe "dentals/index" do
  before(:each) do
    assign(:dentals, [
      stub_model(Dental,
        :dentist => "Dentist",
        :last_cleaning => "",
        :phr_id => 1
      ),
      stub_model(Dental,
        :dentist => "Dentist",
        :last_cleaning => "",
        :phr_id => 1
      )
    ])
  end

  it "renders a list of dentals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Dentist".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
