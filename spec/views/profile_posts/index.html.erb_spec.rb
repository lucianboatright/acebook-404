require 'rails_helper'

RSpec.describe "profile_posts/index", type: :view do
  before(:each) do
    assign(:profile_posts, [
      ProfilePost.create!(),
      ProfilePost.create!()
    ])
  end

  it "renders a list of profile_posts" do
    render
  end
end
