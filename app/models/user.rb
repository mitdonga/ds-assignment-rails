class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :recoverable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  belongs_to :referrer, class_name: "User", optional: true
  has_many :members, class_name: "User", foreign_key: "referrer_id"

  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
