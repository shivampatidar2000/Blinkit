class Address < ApplicationRecord
  belongs_to :user
  validates :street, :city, :pincode, presence: true
end
