class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy

  def total_amount
    #total = 0
    #
    #line_items.each do |line_item|
    #  total+= line_item.smart.price
    #end
    #
    #return total
    total = Smart.joins(:line_items).where(:line_items => {:cart_id => self.id}).sum(:price)

    return total.to_f
  end
end
