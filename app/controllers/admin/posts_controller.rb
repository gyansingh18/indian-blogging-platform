class Admin::PostsController < Admin::BaseController
  before_action :set_post, only: [:show, :destroy]

  def index
    @posts = Post.includes(:user, :comments).order(created_at: :desc)
  end

  def show
  end

  def destroy
    if @post.destroy
      flash[:success] = "Post '#{@post.title}' was successfully deleted."
    else
      flash[:error] = "Failed to delete post."
    end
    redirect_to admin_posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
