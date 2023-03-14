class Notification < ApplicationRecord
  belongs_to :receiver, class_name: "User"
  belongs_to :sender, class_name: "User"
  belongs_to :notifiable, polymorphic: true
  belongs_to :message, foreign_key: 'notifiable_id', optional: true

  scope :unread, -> { where(read_at: nil) }
  scope :from_chatroom, -> (chatroom) { includes(:message).where(messages: {chatroom: chatroom}) }
end
