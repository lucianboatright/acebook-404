require 'rails_helper'

RSpec.describe "profile_posts/show", type: :view do
  before(:each) do
    @profile_post = assign(:profile_post, ProfilePost.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
