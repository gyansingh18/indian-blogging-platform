class Admin::DashboardController < Admin::BaseController
  def index
    @total_posts = Post.count
    @total_users = User.count
    @total_comments = Comment.count
    @published_posts = Post.published.count
    @draft_posts = Post.drafts.count
    
    @recent_posts = Post.includes(:user).order(created_at: :desc).limit(5)
    @recent_users = User.order(created_at: :desc).limit(5)
    @recent_comments = Comment.includes(:user, :post).order(created_at: :desc).limit(5)
  end
end
