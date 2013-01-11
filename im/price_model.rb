#  The PriceModel encapsulates the pricing for an individual product
class PriceModel
  attr_accessor :product_code
  attr_accessor :unit_price
  attr_accessor :volume_price
  attr_accessor :volume_count

  def initialize(product_code, unit_price, options = {})
    @product_code = product_code
    @unit_price = unit_price
    if options[:volume]
      @volume_price = options[:volume][:price]
      @volume_count = options[:volume][:count]
    end
  end

  def volume_pricing?
    !@volume_price.nil?
  end
end