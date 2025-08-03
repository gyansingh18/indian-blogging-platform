class Admin::CommentsController < Admin::BaseController
  before_action :set_comment, only: [:show, :destroy]
  
  def show
    # Show comment details
  end

  def destroy
    if @comment.destroy
      flash[:success] = "Comment was successfully deleted."
    else
      flash[:error] = "Failed to delete comment."
    end
    redirect_to admin_posts_path
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
