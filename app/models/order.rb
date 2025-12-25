class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address
  belongs_to :item
  belongs_to :rider, class_name: "User", optional: true
  enum :status, [ :placed, :picked, :delivered ]
end
