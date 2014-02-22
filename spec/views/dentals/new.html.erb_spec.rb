require 'spec_helper'

describe "dentals/new" do
  before(:each) do
    assign(:dental, stub_model(Dental,
      :dentist => "MyString",
      :last_cleaning => "",
      :phr_id => 1
    ).as_new_record)
  end

  it "renders new dental form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dentals_path, "post" do
      assert_select "input#dental_dentist[name=?]", "dental[dentist]"
      assert_select "input#dental_last_cleaning[name=?]", "dental[last_cleaning]"
      assert_select "input#dental_phr_id[name=?]", "dental[phr_id]"
    end
  end
end
