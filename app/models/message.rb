class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom
  has_many :notifications

  validates :content, presence: true
end
