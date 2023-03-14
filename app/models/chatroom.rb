class Chatroom < ApplicationRecord
  belongs_to :child
  has_many :messages, -> { order(:created_at) }, dependent: :destroy
  has_many :notifications, through: :messages
end
