require 'spec_helper'

describe "Microposts" do

  before(:each) do
    user = Factory(:user)
    visit signin_path
    fill_in :email, :with => user.email
    fill_in :password, :with => user.password
    click_button
  end
  
  describe "creation" do
    describe "failure" do
      it "should not make a new micropost" do
        lambda do
          visit root_path
          # the ID of micropost_content in the DOM can be got at
          # with a symbol in this context, nice!
          fill_in :micropost_content, :with => ""
          click_button
          response.should render_template('pages/home')
          response.should have_selector('section#error_explanation')
        end.should_not change(Micropost, :count)
      end
    end
    describe "success" do
      it "should make a new micropost" do
        content = "Lorem ipsum dolor"
        lambda do
          visit root_path
          fill_in :micropost_content, :with => content
          click_button
          response.should have_selector('span.content', :content => content)
        end.should change(Micropost, :count).by(1)
      end
    end
  end
  
  describe "deletion" do
    describe "failure" do
      it "should not delete the micropost"
    end
    describe "success" do
      it "should delete the micropost"
    end  
  end
  
end
