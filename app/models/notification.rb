class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true

  # Validations
  validates :message, presence: true
  validates :notification_type, presence: true, inclusion: { in: %w[post_published email_sent] }

  # Scopes
  scope :unread, -> { where(read: false) }
  scope :recent, -> { order(created_at: :desc) }

  def mark_as_read!
    update(read: true)
  end
end
