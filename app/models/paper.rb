class Paper < ApplicationRecord
  belongs_to :child
  belongs_to :user

  has_one_attached :photo

  validates :name, presence: true
end
