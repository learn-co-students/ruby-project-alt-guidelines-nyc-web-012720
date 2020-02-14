class FashionShow < ActiveRecord::Base
    belongs_to :designer
    has_many :fashion_show_muses
    has_many :muses, through: :fashion_show_muses


    def self.season_options
        puts "Please enter a season:"
        all = FashionShow.all.map{|show| show.season}.uniq
        all.each_with_index {|season, index| puts " #{index + 1}. #{season}"}
    end
    #=> puts 
    # 1. Spring
    # 2. Summer
    # 3. Fall
    # 4. Winter


    def self.season_string(user_input)
        self.season_options[user_input - 1]
    end
    #=> reutrns the season STRING i.e. "Summer"


    def self.desired_season(s_string)
        FashionShow.all.select{|show| show.season == s_string}
    end
    #=> returns an ARRAY of FashionShow OBJECTS in the selected season

    
    def self.view_by_id
        system "clear"
        puts "Please enter the Fashion Show id:"
        fs_id = user_input
        FashionShow.all.find{|shows| shows.id == fs_id}
    end

    def self.fs_details(info)
        details = info
        system "clear"
        puts "Here are your details for that show:\n\n"

        puts "Fashion Show id# #{details.id}"
        puts "Designer: #{details.designer.name}"
        puts "Season: #{details.season}\n\n"
    end




end