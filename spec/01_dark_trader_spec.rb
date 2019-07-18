require_relative '../lib/01_dark_trader'
crypto_test = crypto

def crypto_present?(coin)
  a=false
  crypto.map{|i| if i.keys==[coin] then a=true end }
  return a
end

describe "test if main currency are there" do
  it "should return BTC" do    
    expect(crypto_present?("BTC")).to be true
  end
end

describe "test if main currency are there" do
  it "should return ETH" do    
    expect(crypto_present?("ETH")).to be true
  end
end

describe "test if main currency are there" do
  it "should return XRP" do    
    expect(crypto_present?("XRP")).to be true
  end
end

describe "check if return an array" do
  it "should return not_nil" do
    expect(crypto_test).not_to be_nil
  end
end

describe "check if return all the coin" do
  it "should return more than 2000" do
    expect(crypto_test.count).to be > 2000
  end
end