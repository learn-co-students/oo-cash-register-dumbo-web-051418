class CashRegister
  attr_accessor :total, :item_list, :last_transaction, :discount
  # attr_reader :discount

  def initialize(discount = nil)
    @total = 0.0
    @discount = discount
    @item_list = []
    @last_transaction = 0
  end
  
  def add_item(item, price, quantity = 1)
    quantity.times do
      self.item_list << item
    end
    self.total += price * quantity
    self.last_transaction += self.total
    
  end
  
  def apply_discount
    if self.discount == nil
      "There is no discount to apply."
    else
      self.total =  total - (total * discount / 100)
      "After the discount, the total comes to $#{self.total.to_i}."
    end
  end
  
  def items
    self.item_list
  end
  
  def void_last_transaction
    self.total -= self.last_transaction
  end
  
end