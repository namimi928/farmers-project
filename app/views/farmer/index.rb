class FarmerIndexView

    attr_reader :farmers

    def initialize(farmers)
        @farmers = farmers
    end

    def render
        puts 'Here\'s a list of all the co-op\'s farmers'
        farmers.each do |farmer|  
          puts "  #{farmer.name}"
        end
    end
end