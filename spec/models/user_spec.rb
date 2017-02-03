require 'spec_helper'

describe User do
  it "name，email, password_digest, adminがあれば有効" do
    user = User.new(name: "Test User", 
                    email: 'tester@example.com', 
                    password_digest: 'hogehoge', 
                    admin: false)
    expect(user).to be_valid
  end
  
  it "emailが無ければ無効" do
    user = User.new(name: "Test User", 
                    email: nil, 
                    password_digest: 'hogehoge', 
                    admin: false)
    expect(user).not_to be_valid
  end
  
  it "emailが重複する場合はエラー" do
    User.create(name: "Test User", 
                    email: 'tester@example.com', 
                    password_digest: 'hogehoge', 
                    admin: false)
    user = User.new(name: "User2", 
                    email: 'tester@example.com', 
                    password_digest: 'hogehoge', 
                    admin: false)
    # be_present はbe_true
    expect(user.errors[:email]).not_to be_present
  end
    
end
