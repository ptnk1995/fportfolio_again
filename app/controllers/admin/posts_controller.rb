class Admin::PostsController < ApplicationController
  layout "admin"
  load_and_authorize_resource except: [:create, :index]
  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.new
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

  def edit
  end

  def update
    if @post.update_attributes post_params
      flash[:success] = t "devise.registrations.updated"
      redirect_to admin_posts_path
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = t "devise.registrations.destroyed"
    else
      flash[:warning] = t "delete_not_success"
    end
    redirect_to admin_posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :user_id, :category_id)
  end
end
