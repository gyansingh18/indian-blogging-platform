class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:create, :destroy]
  before_action :set_post
  before_action :set_comment, only: [:destroy]
  before_action :authorize_user!, only: [:destroy]

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @post, notice: 'Comment was successfully added.'
    else
      redirect_to @post, alert: 'Comment could not be added.'
    end
  end

  def destroy
    @comment.destroy
    redirect_to @post, notice: 'Comment was successfully deleted.'
  end

  private

  def set_post
    @post = Post.friendly.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def authorize_user!
    unless @comment.user == current_user
      redirect_to @post, alert: 'You are not authorized to perform this action.'
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
