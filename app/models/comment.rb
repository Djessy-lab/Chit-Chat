class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :comment_likes, dependent: :destroy

  validates :content, presence: true

  def likers_names
    array = self.comment_likes.map do |like|
      "#{like.user.first_name.capitalize} #{like.user.last_name.capitalize}"
    end
    array.join(", ")
  end
end
