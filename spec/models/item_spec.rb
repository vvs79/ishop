require 'spec_helper'

describe Item do

  it "should do something" do
    (1+1).should == 2
  end

  it "validates the name and makes sure it's not empty" do
    item = Item.new(name: '')
    item.valid?
    item.errors[:name].should_not be_empty
  end

end
