class CashRegister
  attr_reader :discount
  attr_accessor :total, :item_list, :last_trans_amount

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @item_list = []
  end

  def add_item(title, price, quantity = nil)

    if quantity
      @total += price * quantity
      @last_trans_amount = price * quantity
    else
      @total += price
      @last_trans_amount = price
    end

    if quantity != nil
      quantity.times do |item|
        @item_list << title
      end
    else
      @item_list << title
    end
  end

  def apply_discount
    if @discount
      balance = self.total = @total - ((@total * @discount)/100)
      "After the discount, the total comes to $#{balance}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @item_list
  end

  def void_last_transaction
    @total -= @last_trans_amount
  end
end
