class User < ApplicationRecord
  include UsersHelper
  has_many :ordered_products, dependent: :destroy

  validates_format_of :email,:with => Devise::email_regexp
  validates_associated :orders

  enum role: {seller: 0, user: 1, admin: 2}
  after_initialize :self_default_role, if: :new_record?

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable
end
