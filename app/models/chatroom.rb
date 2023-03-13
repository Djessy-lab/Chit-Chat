class Chatroom < ApplicationRecord
  belongs_to :child
  has_many :messages, dependent: :destroy
end
