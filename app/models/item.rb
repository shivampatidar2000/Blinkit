class Item < ApplicationRecord
  belongs_to :seller, class_name: "User"
  validates :name, :price, :quantity, presence: true
  has_many :cart_items
  has_many :carts, through: :cart_items
end
