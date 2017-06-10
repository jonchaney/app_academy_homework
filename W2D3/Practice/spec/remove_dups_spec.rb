require 'remove_dups.rb'

describe 'my uniq' do
  subject(:array_one) { [1, 2, 1, 3, 3] }

  it 'removes duplicates' do
    expect(array_one.my_uniq).to eq(array_one.uniq)
  end

end
