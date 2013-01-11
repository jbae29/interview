require 'pricer.rb'
require 'price_model.rb'

describe Pricer, "#price" do
  it "should price simple units" do
    pricer = Pricer.new([PriceModel.new("A", 1.59)])
    pricer.price("A", 7).should == (1.59 * 7)
  end

  it "should price volume units" do
    pricer = Pricer.new([PriceModel.new("A", 1.59, :volume => {:price => 5.99, :count => 4})])
    pricer.price("A", 4).should == 5.99
  end

  it "should price both simple and volume units" do
    pricer = Pricer.new([PriceModel.new("A", 1.59, :volume => {:price => 5.99, :count => 4})])
    pricer.price("A", 7).should == 5.99 + (1.59 * 3)    
  end
end