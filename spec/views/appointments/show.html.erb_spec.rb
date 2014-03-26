require 'spec_helper'

describe "appointments/show" do
  before(:each) do
    @appointment = assign(:appointment, stub_model(Appointment,
      :doctor => "Doctor",
      :reason => "Reason",
      :results => "Results",
      :phr_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Doctor/)
    rendered.should match(/Reason/)
    rendered.should match(/Results/)
    rendered.should match(/1/)
  end
end
