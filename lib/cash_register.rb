require 'pry'

class CashRegister
  
  attr_accessor :total, :discount, :items, :last_transaction_total
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    # @last_transaction_total = 0
  end

  def add_item(title, price, quantity = 1)
    self.total += price * quantity
    quantity.times {items << title}
    self.last_transaction_total = price * quantity
  end
  
  def apply_discount
    if self.total != 0
      self.total -= self.total * discount/ 100
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end
  
  def void_last_transaction
    self.total -= self.last_transaction_total
  end
end

binding.pry