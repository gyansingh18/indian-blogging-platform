class PostNotificationJob < ApplicationJob
  queue_as :default

  def perform(post)
    # Create notification for the post author
    Notification.create!(
      user: post.user,
      post: post,
      message: "Your post '#{post.title}' has been published successfully!",
      notification_type: 'post_published'
    )

    # Simulate sending email notification
    # In a real app, you would use ActionMailer here
    Rails.logger.info "Email notification sent to #{post.user.email} for post: #{post.title}"
  end
end
