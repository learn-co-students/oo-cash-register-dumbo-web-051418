class CashRegister
  attr_accessor :discount, :total, :item_list

  def initialize (discount=0,total=0)
    @discount=discount
    @total=total
    @item_list=[]
    @last_price=0
    @quantity=0
  end

  def total
    return @total
  end

  def add_item (title,price,quantity=1)
    @total+=price*quantity
    for i in 1..quantity do
      @item_list.push(title)
    end
    @last_price=price*quantity
  end

  def apply_discount
    @total=@total-(@total*@discount/100)
    if discount==0
      return "There is no discount to apply."
    else
      return "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    return @item_list
  end

  def void_last_transaction
    @total-=@last_price
    for i in 1..@quantity do
      @item_list.pop()
    end
  end

end
