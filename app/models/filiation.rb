class Filiation < ApplicationRecord
  attr_accessor :accepts, :declines

  belongs_to :child
  belongs_to :user

  enum progress: { pending: 0, accepted: 1, declined: 2 }
end
