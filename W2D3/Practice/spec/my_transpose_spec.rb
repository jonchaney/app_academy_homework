require 'my_transpose.rb'

describe 'my_transpose' do
  subject("rows") { [[0, 1, 2], [3, 4, 5], [6, 7, 8] ] }
  it "transposes an array" do
    expect(rows.my_transpose).to eq(rows.transpose)
  end
end
