class ProfilePostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile_post, only: [:show, :edit, :update, :destroy]

  # GET /profile_posts
  # GET /profile_posts.json
  def index
    @profile_posts = ProfilePost.all
  end

  # GET /profile_posts/1
  # GET /profile_posts/1.json
  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts
  end

  # GET /profile_posts/new
  def new
    @profile_post = ProfilePost.new
  end

  # GET /profile_posts/1/edit
  def edit
  end

  # POST /profile_posts
  # POST /profile_posts.json
  def create
    @profile_post = ProfilePost.new(profile_post_params)

    respond_to do |format|
      if @profile_post.save
        format.html { redirect_to @profile_post, notice: 'Profile post was successfully created.' }
        format.json { render :show, status: :created, location: @profile_post }
      else
        format.html { render :new }
        format.json { render json: @profile_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profile_posts/1
  # PATCH/PUT /profile_posts/1.json
  def update
    respond_to do |format|
      if @profile_post.update(profile_post_params)
        format.html { redirect_to @profile_post, notice: 'Profile post was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile_post }
      else
        format.html { render :edit }
        format.json { render json: @profile_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_posts/1
  # DELETE /profile_posts/1.json
  def destroy
    @profile_post.destroy
    respond_to do |format|
      format.html { redirect_to profile_posts_url, notice: 'Profile post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile_post
      @profile_post = ProfilePost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_post_params
      params.fetch(:profile_post, {})
    end
end
