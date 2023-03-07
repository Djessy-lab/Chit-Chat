class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :post_likes, dependent: :destroy
  has_many :child_posts, dependent: :destroy
  has_many :children, through: :child_posts

  validates :content, presence: true

  has_many_attached :photos
end
