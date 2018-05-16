
class CashRegister
  attr_accessor :discount, :total, :items, :transactions

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = Array.new
    @transactions = Array.new
  end

  def add_item(title, price, quantity=1)
    (0...quantity).each do |x|
      self.items.push(title)
    end
    self.transactions.push(price*quantity)
    self.total += price*quantity
  end

  def apply_discount
    self.total -= 200
    if self.total < 0
      "There is no discount to apply."
    else
      "After the discount, the total comes to $#{self.total}."
    end
  end

  def void_last_transaction
    self.total -= self.transactions.pop
  end

end
