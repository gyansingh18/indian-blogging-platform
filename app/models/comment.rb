class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # Validations
  validates :content, presence: true, length: { minimum: 2, maximum: 500 }
  validates :user_id, presence: true
  validates :post_id, presence: true

  # Scopes
  scope :recent, -> { order(created_at: :desc) }

  def author_name
    user.display_name
  end
end
