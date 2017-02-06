require 'spec_helper'

before :each do
  
end


describe Item do
  it "nameとpriceが無ければ無効" do
    item = Item.create(name: "ice", price: 100)
    expect(item).to be_valid
  end
    
  it "priceは整数のみ" do
    item = Item.create(name: "ice", price: 10.5)
    expect(item.errors[:price]).to be_present
  end

end