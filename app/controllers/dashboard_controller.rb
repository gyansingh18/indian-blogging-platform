class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.posts.includes(:comments).recent
    @published_posts = @posts.published
    @draft_posts = @posts.drafts
    @recent_comments = current_user.comments.includes(:post).recent.limit(5)
    @notifications = current_user.notifications.unread.recent.limit(10)
  end
end
