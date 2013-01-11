require 'pricer.rb'

#  Terminal used to interact with pricer.
class PointOfSaleTerminal
  def initialize(pricing)
    @pricer = Pricer.new(pricing)
    @counter = {}
  end

  #  Scan a single product code towards the total.
  def scan(product_code)
    @counter[product_code] = @counter[product_code] ? @counter[product_code]+1 : 1
  end

  def subtotal
    total(false)
  end

  def total(reset = true)
    t = 0.0
    @counter.each do |product_code, count|
      t += @pricer.price(product_code, count)
    end
    @counter = {} if reset
    t
  end
end