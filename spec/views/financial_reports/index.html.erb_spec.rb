require 'spec_helper'

describe "financial_reports/index" do
  before(:each) do
    assign(:financial_reports, [
      stub_model(FinancialReport),
      stub_model(FinancialReport)
    ])
  end

  it "renders a list of financial_reports" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
