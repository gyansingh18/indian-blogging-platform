class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  # Friendly ID for slugs
  extend FriendlyId
  friendly_id :title, use: :slugged

  # Validations
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :body, presence: true, length: { minimum: 10 }
  validates :status, presence: true, inclusion: { in: %w[draft published] }
  validates :slug, presence: true, uniqueness: true

  # Scopes
  scope :published, -> { where(status: 'published') }
  scope :drafts, -> { where(status: 'draft') }
  scope :recent, -> { order(created_at: :desc) }

  # Callbacks
  before_validation :set_default_status, on: :create
  after_update :trigger_notification, if: :saved_change_to_status?

  # Ransack allowlist
  def self.ransackable_attributes(auth_object = nil)
    ["body", "created_at", "id", "id_value", "slug", "status", "title", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user", "comments"]
  end

  def published?
    status == 'published'
  end

  def draft?
    status == 'draft'
  end

  private

  def set_default_status
    self.status ||= 'draft'
  end

  def trigger_notification
    if published?
      PostNotificationJob.perform_later(self)
    end
  end
end
