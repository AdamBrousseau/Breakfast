require 'spec_helper'

describe Eye do

  let(:user) { FactoryGirl.create(:user) }
  let(:phr) { FactoryGirl.create(:phr, user: user) }
  
  before { @eye = phr.eyes.build(

  	date: DateTime.civil(1980, 1, 2),
    doctor: "Dr Who",

    glass_od_sph: '-2.00'.to_f,
    glass_od_cyl: '+1.00'.to_f,
    glass_od_axis: '45'.to_i,
    glass_od_prism: '0.5'.to_f,
    glass_od_base: 'UP',
    glass_od_add: '+2.00'.to_f,
      
    glass_os_sph: '-2.00'.to_f,
    glass_os_cyl: '+1.00'.to_f,
    glass_os_axis: '1'.to_i,
    glass_os_prism: '0.5'.to_f,
    glass_os_base: 'DOWN',
    glass_os_add: '+2.00'.to_f,

    cont_od_pwr: '-2.75'.to_f,
    cont_od_bc: '8.7'.to_f,
    cont_od_dia: '14.0'.to_f,
    cont_od_cyl: '-2.25'.to_f,
    cont_od_axis: '160'.to_i,
    cont_od_add: '+1.75'.to_f,
    cont_od_colour: 'green',
    cont_od_brand: 'Ophtha-Lens',

    cont_os_pwr: '-3.50'.to_f,
    cont_os_bc: '8.7'.to_f,
    cont_os_dia: '14.0'.to_f,
    cont_os_cyl: '-2.25'.to_f,
    cont_os_axis: '160'.to_i,
    cont_os_add: '+1.75'.to_f,
    cont_os_colour: 'green',
    cont_os_brand: 'Ophtha-Lens',

    comment: "This was my Glass prescription results",
    comment2: "This was my Contact prescription results")}

  subject { @eye }

  it { should respond_to(:date) }
  it { should respond_to(:doctor) }
  
  it { should respond_to(:glass_od_sph) }
  it { should respond_to(:glass_od_cyl) }
  it { should respond_to(:glass_od_axis) }
  it { should respond_to(:glass_od_prism) }
  it { should respond_to(:glass_od_base) }
  it { should respond_to(:glass_od_add) }
  
  it { should respond_to(:glass_os_sph) }
  it { should respond_to(:glass_os_cyl) }
  it { should respond_to(:glass_os_axis) }
  it { should respond_to(:glass_os_prism) }
  it { should respond_to(:glass_os_base) }
  it { should respond_to(:glass_os_add) }
  
  it { should respond_to(:cont_od_pwr) }
  it { should respond_to(:cont_od_bc) }
  it { should respond_to(:cont_od_dia) }
  it { should respond_to(:cont_od_cyl) }
  it { should respond_to(:cont_od_axis) }
  it { should respond_to(:cont_od_add) }
  it { should respond_to(:cont_od_colour) }
  it { should respond_to(:cont_od_brand) }
  
  it { should respond_to(:cont_os_pwr) }
  it { should respond_to(:cont_os_bc) }
  it { should respond_to(:cont_os_dia) }
  it { should respond_to(:cont_os_cyl) }
  it { should respond_to(:cont_os_axis) }
  it { should respond_to(:cont_os_add) }
  it { should respond_to(:cont_os_colour) }
  it { should respond_to(:cont_os_brand) }
  
  it { should respond_to(:comment) }
  it { should respond_to(:comment2) }

  it { should respond_to(:deleted) }
  it { should respond_to(:phr_id) }
  it { should respond_to(:phr) }
  its(:phr) { should eq phr }

  it { should be_valid }

  describe "when phr_id is not present" do
    before { @eye.phr_id = nil }
    it { should_not be_valid }
  end

  describe "when date is not present" do
    before { @eye.date = nil }
    it { should_not be_valid }
  end

  describe "when doctor is not present" do
    before { @eye.doctor = nil }
    it { should_not be_valid }
  end

  describe "when glass_od_base is valid" do
    it "should be valid" do
      bases = %w[UP DOWN IN OUT N/A]
      bases.each do |valid_base|
        @eye.glass_od_base = valid_base
        expect(@eye).to be_valid
      end
    end
  end

  describe "when glass_od_base is invalid" do
    it "should not be valid" do
      bases = %w[Other NULL]
      bases.each do |invalid_base|
        @eye.glass_od_base = invalid_base
        expect(@eye).not_to be_valid
      end
    end
  end

  describe "when glass_os_base is valid" do
    it "should be valid" do
      bases = %w[UP DOWN IN OUT N/A]
      bases.each do |valid_base|
        @eye.glass_os_base = valid_base
        expect(@eye).to be_valid
      end
    end
  end

  describe "when glass_os_base is invalid" do
    it "should not be valid" do
      bases = %w[Other NULL 1 0]
      bases.each do |invalid_base|
        @eye.glass_os_base = invalid_base
        expect(@eye).not_to be_valid
      end
    end
  end

  describe "when glass_od_axis is valid" do
    it "should be valid" do
      axiss = %w[1 2 10 100 180 179]
      axiss.each do |valid_axis|
        @eye.glass_od_axis = valid_axis
        expect(@eye).to be_valid
      end
    end
  end

  describe "when glass_od_axis is invalid" do
    it "should not be valid" do
      axiss = %w[0 -1 181 254 255 256 NULL]
      axiss.each do |invalid_axis|
        @eye.glass_od_axis = invalid_axis
        expect(@eye).not_to be_valid
      end
    end
  end

  describe "when glass_os_axis is valid" do
    it "should be valid" do
      axiss = %w[1 2 10 100 180 179]
      axiss.each do |valid_axis|
        @eye.glass_os_axis = valid_axis
        expect(@eye).to be_valid
      end
    end
  end

  describe "when glass_os_axis is invalid" do
    it "should not be valid" do
      axiss = %w[0 -1 181 254 255 256 NULL]
      axiss.each do |invalid_axis|
        @eye.glass_os_axis = invalid_axis
        expect(@eye).not_to be_valid
      end
    end
  end

  describe "when cont_od_axis is valid" do
    it "should be valid" do
      axiss = %w[1 2 10 100 180 179]
      axiss.each do |valid_axis|
        @eye.cont_od_axis = valid_axis
        expect(@eye).to be_valid
      end
    end
  end

  describe "when cont_od_axis is invalid" do
    it "should not be valid" do
      axiss = %w[0 -1 181 254 255 256 NULL]
      axiss.each do |invalid_axis|
        @eye.cont_od_axis = invalid_axis
        expect(@eye).not_to be_valid
      end
    end
  end

  describe "when cont_os_axis is valid" do
    it "should be valid" do
      axiss = %w[1 2 10 100 180 179]
      axiss.each do |valid_axis|
        @eye.cont_os_axis = valid_axis
        expect(@eye).to be_valid
      end
    end
  end

  describe "when cont_os_axis is invalid" do
    it "should not be valid" do
      axiss = %w[0 -1 181 254 255 256 NULL]
      axiss.each do |invalid_axis|
        @eye.cont_os_axis = invalid_axis
        expect(@eye).not_to be_valid
      end
    end
  end

  describe "when comment is too long" do
    before { @eye.comment = "a" * 201 }
    it { should_not be_valid }
  end

  describe "when comment2 is too long" do
    before { @eye.comment2 = "a" * 201 }
    it { should_not be_valid }
  end
end