require 'spec_helper'

describe "participation_reports/new" do
  before(:each) do
    assign(:participation_report, stub_model(ParticipationReport).as_new_record)
  end

  it "renders new participation_report form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", participation_reports_path, "post" do
    end
  end
end
