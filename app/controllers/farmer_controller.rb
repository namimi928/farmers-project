require 'pry'
class FarmerController
  
  def register
    FarmerNewView.new.render
  end

  def create(farmer_name)
    farmer = Farmer.new(farmer_name)
    view = FarmerCreateView.new(farmer)
    view.render
  end  
  
  def show(farmer_name)
    farmer = Farmer.find_by_name(farmer_name)
    view = FarmerShowView.new(farmer)
    view.render
  end

  def delete(farmer_name)
    farmer = Farmer.find_by_name(farmer_name)
    view = FarmerDeleteView.new(farmer)
    view.render
    Farmer.unregister(farmer)  
  end

  def index
    farmers = Farmer.all
    view = FarmerIndexView.new(farmers)
    view.render
  end

end