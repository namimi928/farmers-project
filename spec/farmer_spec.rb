require "spec_helper"
require "pry"

describe "Farmer" do
  let(:bubba) {Farmer.new("Bubba", 57, "ID")}

  before(:each) do  
    DB[:conn].execute("DROP TABLE IF EXISTS farmers")
  end

  describe "Attributes" do
      it 'has a name, age and location' do
        farmer = Farmer.new("Erik", 28, "PA")
        expect(farmer.name).to eq("Erik")
        expect(farmer.age).to eq(28)
        expect(farmer.location).to eq('PA')
      end

      it 'has an id that is readable but not writable' do
        bubba
        expect{bubba.id = 1}.to raise_error(NoMethodError)
      end

    describe "#create_table" do
      it 'creates the farmers table in the database' do
        Farmer.create_table
        table_check_sql = "SELECT tbl_name FROM sqlite_master WHERE type='table' AND tbl_name='farmers';"
        expect(DB[:conn].execute(table_check_sql)[0]).to eq(['farmers'])
      end
    end

    describe "#drop_table" do
      it 'drops the farmers table from the database' do
        Farmer.create_table
        Farmer.drop_table
        table_check_sql = "SELECT tbl_name FROM sqlite_master WHERE type='table' AND tbl_name='farmers';"
        expect(DB[:conn].execute(table_check_sql)[0]).to eq(nil)
      end
    end

    describe "#save" do
      it 'saves an instance of the Farmer class to the database' do
        Farmer.create_table
        bubba.save
        expect(bubba.id).to eq(1)
        expect(DB[:conn].execute("SELECT * FROM farmers")).to eq([[1, "Bubba", 57, "ID"]])
      end
    end

    describe "#create" do
      before(:each) do
        Farmer.create_table
      end
      it 'takes in a hash of attributes and uses metaprogramming to create a new farmer object. Then it uses the #save method to save that farmer to the database' do
        Farmer.create(name: "Sebastian", age: 24, location: "Brooklyn")
        expect(DB[:conn].execute("SELECT * FROM farmers")).to eq([[1, "Sebastian", 24, "Brooklyn"]])
      end
      it 'returns the new object that it instantiated' do
        farmer = Farmer.create(name: "Sebastian", age: 24, location: "Brooklyn")
        expect(farmer).to be_a(Farmer)
        expect(farmer.name).to eq("Sebastian")
        expect(farmer.age).to eq(24)
        expect(farmer.location).to eq("Brooklyn")
      end
    end

    describe "#find_by_name" do
      before(:each) do
        Farmer.create_table
        bubba = Farmer.create(name: "Bubba", age: 57, location: "ID")
        nami = Farmer.create(name: "Nami", age: 32, location: "FL")
        nami2 = Farmer.create(name: "Nami", age: 42, location: "IL")
        erik = Farmer.create(name: "Erik", age: 28, location: "FL")
        sebastian = Farmer.create(name: "Sebastian", age: 24, location: "FL")
        leon = Farmer.create(name: "Leon", age: 65, location: "MA")
        mallory = Farmer.create(name: "Mallory", age: 28, location: "ID")
      end
      it 'can retrieve a farmers info from the database' do
        farmer = Farmer.find_by_name("Nami")
        expect(farmer.length).to eq(2)
        expect(farmer.first.name).to eq("Nami")
      end
    end
  end
end