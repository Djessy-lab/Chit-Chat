class Child < ApplicationRecord
  has_many :filiations, dependent: :destroy
  has_many :users, through: :filiations
  has_many :child_posts, dependent: :destroy
  has_many :posts, through: :child_posts

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthdate, presence: true

  has_one_attached :photo

  accepts_nested_attributes_for :filiations, reject_if: :all_blank

  has_many :family_filiations, -> { family }, class_name: "User"
  has_many :family_children, through: :family_filiations, source: :user

  has_many :nanny_filiations, -> { nanny }, class_name: "User"
  has_many :nanny_children, through: :nanny_filiations, source: :user

  def name
    "#{first_name} - #{last_name}"
  end
end
