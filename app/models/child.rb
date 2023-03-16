class Child < ApplicationRecord
  has_many :filiations, dependent: :destroy
  has_many :users, through: :filiations
  has_many :child_posts, dependent: :destroy
  has_many :posts, through: :child_posts
  has_many :feedbacks, dependent: :destroy
  has_many :chatrooms, dependent: :destroy
  has_many :papers, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthdate, presence: true

  has_one_attached :photo

  has_many :family_filiations, -> { family }, class_name: "Filiation", inverse_of: 'child', dependent: :destroy
  has_many :families, through: :family_filiations, source: :user

  has_one :nanny_filiation, -> { nanny }, class_name: "Filiation", inverse_of: 'child', dependent: :destroy
  has_one :nanny, through: :nanny_filiation, source: :user

  accepts_nested_attributes_for :filiations, reject_if: :all_blank
  accepts_nested_attributes_for :family_filiations, reject_if: :all_blank
  accepts_nested_attributes_for :nanny_filiation, reject_if: :all_blank

  def name
    "#{first_name} - #{last_name}"
  end
end
