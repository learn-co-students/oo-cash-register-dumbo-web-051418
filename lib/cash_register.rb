require 'pry'

class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = 0
  end


  def basketing(food, quantity)
    quantity.times { self.items << food }
  end


  def add_item(food, cost, quantity=1)
    basketing(food, quantity)
    self.total += (cost*quantity)
  end


  def apply_discount
    if discount > 0
      self.total = total - (total*(discount/100.0))
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def new_total
    self.last_transaction += self.total
  end

  def void_last_transaction
    self.total -= new_total
  end

end
