class TagsController < ApplicationController
  def show
    @name = params[:name]
    @posts = Post.published.tagged_with(@name)
  end
end
