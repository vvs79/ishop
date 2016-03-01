require 'spec_helper'


describe Order do

  it "calculate the total price of the order" do

  	# item1 = Item.new(price: 10)
  	# item2 = Item.new(price: 20)
    item1 = FactoryGirl.create(:item)
    item2 = FactoryGirl.create(:item, price: 20)

  	# order = Order.new
    # order = FactoryGirl.create(:order) ???????????????????
  	# order.items << item1
  	# order.items << item2

  	# order.calculate_total
  	# order.total.should == 30
    # expect(order.total).to eq(30)

  end

  it "raises exception if order has no items in it" do
    expect( -> {FactoryGirl.create(:order)}).to raise_exception
  end

  it "validates the name and makes sure it's not empty" do
  	item = Item.new(name: '')
  	item.valid?
  	item.errors[:name].should_not be_empty
  end

end