class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :upate, :destroy, :edit, :new, :unpublished]

  def index
    @posts = Post.published.all
  end

  def unpublished
    @posts = Post.unpublished.all
    render :index
  end

  def show
    if user_signed_in?
      @post = Post.friendly.find(params[:id])
    else
      @post = Post.published.friendly.find(params[:id])
    end

    @post = present(@post)

    set_page_head_data(@post)
    render layout: "single_post"
  end

  def new
    @post = Post.new
  end

  def edit
    post = Post.friendly.find(params[:id])
    @post = present(post)
    render layout: "admin"
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end

  end

  def update
    post = Post.friendly.find(params[:id])
    post.user = current_user
    @post = present(post)
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private
    def set_page_head_data(post)
      set_page_title(post.title)
      set_page_description(post.tagline)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :text, :tagline, :image_id, :draft)
    end
end
