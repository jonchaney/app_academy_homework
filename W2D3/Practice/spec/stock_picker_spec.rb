require 'stock_picker'

describe "stock picker" do
  subject(:stock_prices){[1,2,3,4]}
  it "returns most profitable pair" do
    expect(stock_prices.stock_picker).to eq([0,3])
  end

  it "returns least loss" do
    stock_prices = [4,3,0,-2]
    expect(stock_prices.stock_picker).to eq([0,1])
  end
end
