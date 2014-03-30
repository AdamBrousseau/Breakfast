require 'spec_helper'

describe "appointments/index" do
  before(:each) do
    assign(:appointments, [
      stub_model(Appointment,
        :doctor => "Doctor",
        :reason => "Reason",
        :results => "Results",
        :phr_id => 1
      ),
      stub_model(Appointment,
        :doctor => "Doctor",
        :reason => "Reason",
        :results => "Results",
        :phr_id => 1
      )
    ])
  end

  it "renders a list of appointments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Doctor".to_s, :count => 2
    assert_select "tr>td", :text => "Reason".to_s, :count => 2
    assert_select "tr>td", :text => "Results".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
