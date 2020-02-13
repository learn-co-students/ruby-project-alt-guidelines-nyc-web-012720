class Designer < ActiveRecord::Base
    has_many :fashion_shows


    def self.designer_options
        system "clear"
        puts "Please enter a designer: "
        all = Designer.all.map{|designer| designer.name}.uniq
        all.each_with_index {|designer, index| puts " #{index+1}. #{designer}"}
    end
    #=> puts
    # 1. Gucci
    # 2. Tom Ford
    # 3. Chanel
    # 4. Giorgio Armani
    # 5. Christian Dior
    # 6. Oscar de la Renta
    # 7. Karl Lagerfeld


    def self.designer_string(user_input)
        self.designer_options[user_input - 1]
    end
    #=> reutrns the designer STRING i.e. "Gucci"


    def self.designers_by_season(fs_object)
        system "clear"
        puts "Please enter a designer: "
        all = fs_object.map{|show| show.designer.name}.uniq
        all.each_with_index {|designer, index| puts " #{index+1}. #{designer}"}
    end
    #=> returns an ARRAY of Desinger name STRINGS

    # binding.pry



end