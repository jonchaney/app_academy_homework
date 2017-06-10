require 'two_sum.rb'

describe "two sum" do
  subject(:arr){[-1,0,2,-2,1]}

  it "rejects duplicates" do
    expect(arr.two_sum).to eq([[0,4],[2,3]])
  end
end
