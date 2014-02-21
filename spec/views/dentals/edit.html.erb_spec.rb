require 'spec_helper'

describe "dentals/edit" do
  before(:each) do
    @dental = assign(:dental, stub_model(Dental,
      :dentist => "MyString",
      :last_cleaning => "",
      :phr_id => 1
    ))
  end

  it "renders the edit dental form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dental_path(@dental), "post" do
      assert_select "input#dental_dentist[name=?]", "dental[dentist]"
      assert_select "input#dental_last_cleaning[name=?]", "dental[last_cleaning]"
      assert_select "input#dental_phr_id[name=?]", "dental[phr_id]"
    end
  end
end
