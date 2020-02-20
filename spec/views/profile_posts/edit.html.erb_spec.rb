require 'rails_helper'

RSpec.describe "profile_posts/edit", type: :view do
  before(:each) do
    @profile_post = assign(:profile_post, ProfilePost.create!())
  end

  it "renders the edit profile_post form" do
    render

    assert_select "form[action=?][method=?]", profile_post_path(@profile_post), "post" do
    end
  end
end
