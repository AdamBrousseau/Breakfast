require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
      describe "after submission" do
        before { click_button submit }

        it { should have_title('Sign up') }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirm Password", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
       before { click_button submit }
       let(:user) { User.find_by(email: 'user@example.com') }

       it { should have_link('Sign out') }
       it { should have_title(user.name) }
       it { should have_selector('div.alert.alert-success', text: 'Welcome') }
     end
   end
 end

 describe "profile page" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:p1) { FactoryGirl.create(:phr, user: user) }
  let!(:p2) { FactoryGirl.create(:phr, user: user) }
  #before {10.times { FactoryGirl.create(:phr, user: user) } }

  before(:each) do
    sign_in user
    visit user_path(user)
  end

  it { should have_content(user.name) }
  it { should have_title(user.name) }


  describe "phrs" do
    it { should have_content(p1.first_name) }
    it { should have_content(p2.first_name) }
  end

  #describe "pagination" do
    
    #after {Phr.delete_all }

  #  it { should have_selector('div.pagination') }

  #  it "should list each phr" do
  #    user.phrs.paginate(page: 1).each do |phr|
  #      expect(page).to have_selector('span.first_name', text: phr.first_name)
  #    end
  #  end
  #end
end



  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }

    before do
      sign_in user
      visit edit_user_path(user)
    end


    describe "page" do
      it { should have_content("Update Your Profile") }
      it { should have_title("Edit Profile") }
      it { should have_link('Change Gravatar', href: 'http://gravatar.com/emails') }
    end

    describe "with invalid information" do
      before { click_button "Save changes" }
      it { should have_content('error') }
      it { should have_content("Update Your Profile") }
      it { should have_title("Edit Profile") }
    end

    describe "with valid information" do
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@webphr.com" }
      before do
        fill_in "Name",             with: new_name
        fill_in "Email",            with: new_email
        fill_in "Password",         with: user.password
        fill_in "Confirm Password", with: user.password
        click_button "Save changes"
      end

      it { should have_title(new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign out', href: signout_path) }
      specify { expect(user.reload.name).to  eq new_name }
      specify { expect(user.reload.email).to eq new_email }
    end

    describe "forbidden attributes" do
      let(:params) do
        { user: { admin: true, password: user.password,
          password_confirmation: user.password } }
        end
        before do
          sign_in user, no_capybara: true
          patch user_path(user), params
        end
        specify { expect(user.reload).not_to be_admin }
      end
    end
  end