module TotalCalculator
  def total
    self.line_items.inject(0) { |counter, ln| counter + ln.count * ln.product.price }
  end
  
  def product_count
    self.line_items.inject(0) { |counter, ln| counter + ln.count }
  end
end