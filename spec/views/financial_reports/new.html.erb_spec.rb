require 'spec_helper'

describe "financial_reports/new" do
  before(:each) do
    assign(:financial_report, stub_model(FinancialReport).as_new_record)
  end

  it "renders new financial_report form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", financial_reports_path, "post" do
    end
  end
end
