require 'spec_helper'

describe "financial_reports/edit" do
  before(:each) do
    @financial_report = assign(:financial_report, stub_model(FinancialReport))
  end

  it "renders the edit financial_report form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", financial_report_path(@financial_report), "post" do
    end
  end
end
