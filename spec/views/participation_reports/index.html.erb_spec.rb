require 'spec_helper'

describe "participation_reports/index" do
  before(:each) do
    assign(:participation_reports, [
      stub_model(ParticipationReport),
      stub_model(ParticipationReport)
    ])
  end

  it "renders a list of participation_reports" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
