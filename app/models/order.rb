class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items
  has_many :items, through: :order_items

  # we want an order to have at least one item...
  validate :order_must_have_at_least_one_item

  # it needs to add an error to .errors!
  def order_must_have_at_least_one_item
    if item_ids.empty? # condition_fails
      # add an error
      errors.add(:items, "must exist -- choose at least one!")
    end
  end

end
