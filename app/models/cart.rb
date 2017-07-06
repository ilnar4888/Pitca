class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items
  belongs_to :order

  validates_associated :line_items
end
