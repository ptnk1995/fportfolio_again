class Admin::PostsController < ApplicationController
  layout "admin"

  def index
    @posts = Post.all
  end

  def new
  end

  def create
    @post = current_user.posts.new post_params
    if @post.save
      flash[:success] = t "blogs.created"
      redirect_to admin_posts_path
    else
      flash[:danger] = t "blogs.create_failed"
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :user_id, :category_id)
  end
end
