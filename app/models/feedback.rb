class Feedback < ApplicationRecord
  belongs_to :child
  belongs_to :user

  validates :rating, length: { maximum: 3 }

  scope :today, -> { where("DATE(created_at) = ?", Date.today) }
end
