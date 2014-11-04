require 'spec_helper'

describe "participation_reports/show" do
  before(:each) do
    @participation_report = assign(:participation_report, stub_model(ParticipationReport))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
