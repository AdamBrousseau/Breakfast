require 'spec_helper'

describe "participation_reports/edit" do
  before(:each) do
    @participation_report = assign(:participation_report, stub_model(ParticipationReport))
  end

  it "renders the edit participation_report form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", participation_report_path(@participation_report), "post" do
    end
  end
end
