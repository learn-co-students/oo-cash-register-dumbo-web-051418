
class CashRegister
  attr_accessor :discount, :total, :title, :price, :item, :last_transaction_amount

  def initialize(discount=nil,total=0)
    @total = total
    @discount = discount
    @item = []
  end

  def add_item(title, price, quantity=1)
      quantity.times do
        self.item << title
      end
      self.last_transaction_amount = price * quantity
    if quantity != nil
      self.total += (price * quantity)
    else
      self.total += price
    end
  end

  def apply_discount
    if discount != nil
      self.total = self.total - ((self.total * discount)/100)
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    self.item
  end

  def void_last_transaction
    self.total -= self.last_transaction_amount
  end

end

# binding.pry
