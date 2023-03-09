class Filiation < ApplicationRecord
  attr_accessor :accepts, :declines

  belongs_to :child
  belongs_to :user

  scope :nanny, ->  { includes(:user).where(users: {id: User.nanny}) }
  scope :family, ->  { includes(:user).where(users: {id: User.family}) }

  enum progress: { pending: 0, accepted: 1, declined: 2 }
  validates :child, uniqueness: { scope: :user }
end
