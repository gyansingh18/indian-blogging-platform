class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @q = Post.published.ransack(params[:q])
    @posts = @q.result(distinct: true).includes(:user, :comments)

    # Apply filters
    @posts = @posts.where(user: current_user) if params[:my_posts] == '1' && user_signed_in?
    @posts = @posts.where('created_at >= ?', params[:date_from]) if params[:date_from].present?
    @posts = @posts.where('created_at <= ?', params[:date_to]) if params[:date_to].present?
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user).recent
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully deleted.'
  end

  private

  def set_post
    @post = Post.friendly.find(params[:id])
  end

  def authorize_user!
    unless @post.user == current_user
      redirect_to posts_path, alert: 'You are not authorized to perform this action.'
    end
  end

  def post_params
    params.require(:post).permit(:title, :body, :status)
  end
end
