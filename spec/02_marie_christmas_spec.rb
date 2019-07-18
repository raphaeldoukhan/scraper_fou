require_relative '../lib/02_marie_christmas'
city = perform("https://www.annuaire-des-mairies.com/val-d-oise.html")

def city_present?(test)
  city = perform("https://www.annuaire-des-mairies.com/val-d-oise.html")
  a = false
  city.map{|i| if i.keys==[test] then a = true end }
  return a
end

describe "test if main town are there" do
  it "should return CERGY - 95800" do
    expect(city_present?("CERGY - 95800")).to be true
  end
end

describe "test if main town are there" do
  it "should return SARCELLES - 95200" do
    expect(city_present?("SARCELLES - 95200")).to be true
  end
end

describe "check if return an array" do
  it "should return not_nil" do
    expect(city).not_to be_nil
  end
end

describe "check if return all the cities" do
  it "should return 185" do
    expect(city.count).to eq(185)
  end
end