require 'spec_helper'

describe Type do
  it "nameがあれば有効な状態" do
    type = Type.new(name: "test")
    expect(type).to be_valid
  end
  
  it "nameが空であれば無効な状態" do
    type = Type.new(name: nil)
    expect(type).not_to be_valid
    
    # nameに関するエラー
    expect(type.errors[:name]).to be_present
  end
  
end