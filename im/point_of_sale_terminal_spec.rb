require "point_of_sale_terminal.rb"
require "price_model.rb"

describe PointOfSaleTerminal, "#total" do
  def pricing_models
    [PriceModel.new("A", 2.00, :volume => {:price => 7.00, :count => 4}),
     PriceModel.new("B", 12.00),
     PriceModel.new("C", 1.25, :volume => {:price => 6.00, :count => 6}),
     PriceModel.new("D", 0.15)]
  end
  
  it "should price 'ABCDABAA' to $32.40" do
    terminal = PointOfSaleTerminal.new(pricing_models)
    "ABCDABAA".each_char do |product_key|
      terminal.scan(product_key)
    end
    terminal.total.should == 32.40
  end

  it "should price 'CCCCCCC' to $7.25" do
    terminal = PointOfSaleTerminal.new(pricing_models)
    "CCCCCCC".each_char do |product_key|
      terminal.scan(product_key)
    end
    terminal.total.should == 7.25
  end
  
  it "should price 'ABCD' to $15.40" do
    terminal = PointOfSaleTerminal.new(pricing_models)
    "ABCD".each_char do |product_key|
      terminal.scan(product_key)
    end
    terminal.total.should == 15.40
  end
  
  it "should price '' to $0.00" do
    terminal = PointOfSaleTerminal.new(pricing_models)
    terminal.total.should == 0.0
  end
end