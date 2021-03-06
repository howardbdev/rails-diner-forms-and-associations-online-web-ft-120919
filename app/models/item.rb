class Item < ApplicationRecord
  belongs_to :menu
  has_many :order_items
  has_many :orders, through: :order_items

  validates :name, :price, :description, presence: true

end
