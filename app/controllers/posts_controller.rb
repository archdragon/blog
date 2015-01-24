class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :upate, :destroy, :edit, :new, :unpublished]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.published.all
  end

  def unpublished
    @posts = Post.unpublished.all
    render :index
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.published.friendly.find(params[:id])
    set_page_head_data(@post)
    render layout: "single_post"
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end

  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post.user = current_user
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
      set_page_head_data(@post)
    end

    def set_page_head_data(post)
      set_page_title(post.title)
      set_page_description(post.tagline)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :text, :tagline, :image_id, :draft)
    end
end
