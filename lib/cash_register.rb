require 'pry'

@@all_items = []

class CashRegister
  attr_reader :discount
  attr_accessor :total

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    @quantity = quantity
    @title = title
    @total += price * quantity
    quantity.times {@items << @title}
    @@all_items << self
   end

  def apply_discount
      discount_decimal = @discount * 0.01
      discounted_total = @total * discount_decimal
      @total -= discounted_total
      @discount > 0 ? "After the discount, the total comes to $#{@total.to_i}." : "There is no discount to apply."
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @@all_items.last.total
  end

end
