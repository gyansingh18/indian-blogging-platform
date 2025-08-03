class Api::PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_api_user!, only: [:show]

  def index
    @posts = Post.published.includes(:user, :comments)

    render json: {
      posts: @posts.map do |post|
        {
          id: post.id,
          title: post.title,
          body: post.body,
          slug: post.slug,
          status: post.status,
          author: post.user.display_name,
          comments_count: post.comments.count,
          created_at: post.created_at,
          updated_at: post.updated_at
        }
      end
    }
  end

  def show
    @post = Post.published.friendly.find(params[:id])

    render json: {
      post: {
        id: @post.id,
        title: @post.title,
        body: @post.body,
        slug: @post.slug,
        status: @post.status,
        author: @post.user.display_name,
        comments: @post.comments.map do |comment|
          {
            id: comment.id,
            content: comment.content,
            author: comment.user.display_name,
            created_at: comment.created_at
          }
        end,
        created_at: @post.created_at,
        updated_at: @post.updated_at
      }
    }
  end

  private

  def authenticate_api_user!
    # Basic token authentication
    token = request.headers['Authorization']&.split(' ')&.last
    return render json: { error: 'Unauthorized' }, status: :unauthorized unless token

    # In a real app, you would validate the JWT token here
    # For now, we'll just check if a token is present
    true
  end
end
