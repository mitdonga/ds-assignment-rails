class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :referrer, class_name: "User", optional: true
  has_many :referees, class_name: "User", foreign_key: "referrer_id"

  validates :name, presence: true

end
