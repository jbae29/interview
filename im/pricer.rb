#  Pricer uses the PriceModels of all the products to determine the prices for a given quantity of products.
class Pricer
  def initialize(pricing_models)
    @pricing_model = {}
    pricing_models.each do |price_model|
      @pricing_model[price_model.product_code] = price_model
    end
  end

  def pricing_model(code)
    @pricing_model[code]
  end

  def price(code, quantity)
    p = 0.0
    #  TODO: We need to notify/warn if the product is not priceable.
    model = pricing_model(code)

    #  Price out volume pricing quantity
    if model.volume_pricing?
      #  Volume pricing is available
      volume_quantity = quantity / model.volume_count
      if volume_quantity
        #  Volume pricing applies
        quantity -= volume_quantity * model.volume_count
        p += volume_quantity * model.volume_price
      end
    end

    #  price out remaining non volume quantity.
    p += quantity * model.unit_price
  end
end