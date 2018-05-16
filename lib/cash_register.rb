
class CashRegister
  attr_accessor :total, :discount, :items

  def initialize(employee_discount = nil)
    @total = 0
    @discount = employee_discount
    @items = []
    @last_transaction = 0
  end

  def add_item(title, price, quantity = 1)
    quantity = 1 if quantity < 1
    transaction = price * quantity
    @total += transaction
    @last_transaction = transaction
    quantity.times { @items << title }
  end

  def apply_discount
    if @discount.nil?
      return "There is no discount to apply."
    end
    @total -= @total * @discount / 100
    @discount = nil
    "After the discount, the total comes to $#{@total}."
  end

  def void_last_transaction
    self.total -= @last_transaction
  end
end
