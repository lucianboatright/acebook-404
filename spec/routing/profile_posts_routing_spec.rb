require "rails_helper"

RSpec.describe ProfilePostsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/profile_posts").to route_to("profile_posts#index")
    end

    it "routes to #new" do
      expect(:get => "/profile_posts/new").to route_to("profile_posts#new")
    end

    it "routes to #show" do
      expect(:get => "/profile_posts/1").to route_to("profile_posts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/profile_posts/1/edit").to route_to("profile_posts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/profile_posts").to route_to("profile_posts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/profile_posts/1").to route_to("profile_posts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/profile_posts/1").to route_to("profile_posts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/profile_posts/1").to route_to("profile_posts#destroy", :id => "1")
    end

  end
end
