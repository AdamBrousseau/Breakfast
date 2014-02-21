require 'spec_helper'

describe "appointments/new" do
  before(:each) do
    assign(:appointment, stub_model(Appointment,
      :doctor => "MyString",
      :reason => "MyString",
      :results => "MyString",
      :phr_id => 1
    ).as_new_record)
  end

  it "renders new appointment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", appointments_path, "post" do
      assert_select "input#appointment_doctor[name=?]", "appointment[doctor]"
      assert_select "input#appointment_reason[name=?]", "appointment[reason]"
      assert_select "input#appointment_results[name=?]", "appointment[results]"
      assert_select "input#appointment_phr_id[name=?]", "appointment[phr_id]"
    end
  end
end
