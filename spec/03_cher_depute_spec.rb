require_relative '../lib/03_cher_depute'
deputes = perform

def depute_present?(last_name)
  deputes = perform
  a = false
  deputes.map{|i| if i["last_name"]==[last_name] then a = true end}
  return a
end

describe "test if main deputes are there" do
  it "should return Mahjoubi" do
    expect(depute_present?("Mahjoubi")).to be true
  end
end

describe "test if main deputes are there" do
  it "should return Villani" do
    expect(depute_present?("Villani")).to be true
  end
end

describe "check if return an array" do
  it "should return not_nil" do
    expect(deputes).not_to be_nil
  end
end

describe "check if return all the cities" do
  it "should return 603" do
    expect(deputes.count).to eq(603)
  end
end