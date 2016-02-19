describe Farmer do 

  let(:newman) { Farmer.new('Newman') }
  let(:bubba) { Farmer.new('Bubba') }

  describe '#initialize' do 
    it 'should create a new farmer with a name and a hometown where they farm' do 
      newman
      expect(newman.name).to eq 'Newman'
    end 
  end

  describe '#count' do 
    it 'The farmer class should know how many farmers exists' do 
      Farmer.all.clear
      newman
      bubba
      expect(Farmer.count).to eq 2
    end 
  end

  describe '#Collectable' do
    it 'can find a farmer by name' do
      Farmer.all.clear 
      newman
      bubba
      expect(Farmer.find_by_name('Newman')).to eq newman
    end
  end
end