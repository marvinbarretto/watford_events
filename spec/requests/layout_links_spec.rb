require 'spec_helper'

describe "LayoutLinks" do
  describe "GET /layout_links" do

    it "should have a Homepage at '/'"  do
      get '/'
      response.should have_selector('title', :content => "Home")
      response.status.should be(200)
    end

    it "should have a contact page at '/contact'" do
      get '/contact'
      response.should have_selector('title', :content => "Contact")
    end

    it "should have an about page at '/about'" do
      get '/about'
      response.should have_selector('title', :content => "About")
    end

    it "should have a help page at '/help'" do
      get '/help'
      response.should have_selector('title', :content => "Help")
    end
  end
end
