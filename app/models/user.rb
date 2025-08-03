class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  # Validations
  validates :email, presence: true, uniqueness: true

  # Ransack allowlist
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "id", "id_value", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["posts", "comments", "notifications"]
  end

  def display_name
    email.split('@').first
  end
end
