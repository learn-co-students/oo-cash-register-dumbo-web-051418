require 'pry'

class CashRegister
  
  attr_accessor :total, :discount
  
  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = [ ]
    @last_transaction = [ ]
  end
  
  def total
    @total
  end
  
  def add_item(title, price, quantity=1)
    @last_transaction = [price,quantity]
    quantity > 0 ? @total += price*quantity :  @total += price
quantity.times{items << title}
  end

  def apply_discount
    discount_amt = @total * @discount / 100
    @total -= discount_amt
    @discount == 0 ? "There is no discount to apply." : "After the discount, the total comes to $#{total}."
  end
  
  def items
    @items
  end
  
  def void_last_transaction
    @total -= @last_transaction[0]
  end
  
  
end



