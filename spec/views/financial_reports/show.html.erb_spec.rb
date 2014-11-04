require 'spec_helper'

describe "financial_reports/show" do
  before(:each) do
    @financial_report = assign(:financial_report, stub_model(FinancialReport))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
