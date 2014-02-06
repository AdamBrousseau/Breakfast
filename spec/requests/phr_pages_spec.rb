require 'spec_helper'

describe "Phr pages" do

  subject { page }

  describe "index" do
    @user =  FactoryGirl.create(:user)
    #@phr = FactoryGirl.create(:phr, :user => @user)

    before do
      
    end

    it { should have_title('PHR 1') }
    it { should have_content('PHR 2') }

 end
end