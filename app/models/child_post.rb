class ChildPost < ApplicationRecord
  belongs_to :child
  belongs_to :post
end
