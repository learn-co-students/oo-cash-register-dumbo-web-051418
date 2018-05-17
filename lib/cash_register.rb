class CashRegister 
  
  attr_accessor :discount, :total, :items, :last_transaction
  
  def initialize (discount = nil)  
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = 0 
  end 
    
  def add_item(title, price, quantity=1) 
    self.total += (price * quantity)
    quantity.times {self.items << title}
    self.last_transaction = price * quantity
  end 
  
  def apply_discount
    if self.discount 
      self.total -= self.total * self.discount/100
      return "After the discount, the total comes to $#{self.total}."
    else 
      return "There is no discount to apply."
    end 
  end
  
  def void_last_transaction
    self.total -= self.last_transaction
  end 
end 