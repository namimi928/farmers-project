require 'pry'
class CropController
  
  def register  
    CropNewView.new.render
  end

  def create(attributes)
    new_crop = Crop.new(attributes).save
    # farmer_id = Farmer.new(attributes).save
    # view = FarmerCreateView.new(farmer_id)
    # view.render
  end  
  
  def show
    # farmer_name = gets.chomp
    # farmer = Farmer.find_by_name(farmer_name)
    # view = FarmerShowView.new(farmer)
    # view.render
  end

  def delete
    # farmer_name = gets.chomp
    # farmers = Farmer.find_by_name(farmer_name)
    # confirm = FarmerDeleteView.new(farmers).confirm
    # Farmer.unregister(confirm) 
    # FarmerDeleteView.new(farmer_name).render
  end

  def index
    # farmers = Farmer.all
    # view = FarmerIndexView.new(farmers)
    # view.render
  end

end