class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, [ :customer, :seller, :rider ]
  has_many :items, foreign_key: :seller_id
  has_many :addresses
  has_one :cart
  has_many :orders
end
