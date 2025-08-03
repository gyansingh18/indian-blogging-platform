class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:show]

  def index
    @users = User.includes(:posts, :comments).order(created_at: :desc)
  end

  def show
    @user_posts = @user.posts.order(created_at: :desc)
    @user_comments = @user.comments.includes(:post).order(created_at: :desc)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
