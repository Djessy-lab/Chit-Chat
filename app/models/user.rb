class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :filiations, dependent: :destroy
  has_many :children, through: :filiations
  has_many :child_posts, through: :children
  has_many :my_posts, through: :child_posts, source: :post
  has_many :posts, dependent: :destroy
  has_many :comment_likes, dependent: :destroy
  has_many :post_likes, dependent: :destroy

  has_many :accepted_filiations, -> { accepted }, class_name: "Filiation"
  has_many :accepted_children, through: :accepted_filiations, source: :child

  has_many :pending_filiations, -> { pending }, class_name: "Filiation"
  has_many :pending_children, through: :pending_filiations, source: :child

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true

  enum role: { nanny: 0, family: 1 }

  has_one_attached :photo

  def name
    "#{first_name} - #{last_name}"
  end

  # include PgSearch::Model
  # pg_search_scope :search_by_firstname_and_lastname,
  #   against: [ :first_name, :last_name ],
  #   using: {
  #     tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #   }
end
