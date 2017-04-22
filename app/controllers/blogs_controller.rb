class BlogsController < BaseController
  def index
    @posts = Post.all.recent.page(params[:page]).per 1
    @categories = Category.blog
    @posts_search = Post.search(params[:search])
    if params[:category].blank?
      @posts = Post.all.recent.page(params[:page]).per Settings.per_page
    else
      @category = Category.find_by id: params[:category]
      unless @category
        flash[:danger] = t "record_isnt_exist"
        redirect_to blogs_path
      else
        @posts = @category.posts.recent.page(params[:page]).per Settings.per_page
      end
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @posts_of_user = @post.user.posts.except_id params[:id]
  end
end
