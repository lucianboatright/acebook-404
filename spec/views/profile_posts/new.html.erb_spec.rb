require 'rails_helper'

RSpec.describe "profile_posts/new", type: :view do
  before(:each) do
    assign(:profile_post, ProfilePost.new())
  end

  it "renders new profile_post form" do
    render

    assert_select "form[action=?][method=?]", profile_posts_path, "post" do
    end
  end
end
