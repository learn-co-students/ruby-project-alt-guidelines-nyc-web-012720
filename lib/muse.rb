class Muse < ActiveRecord::Base
    has_many :fashion_show_muses
    has_many :fashion_shows, through: :fashion_show_muses


    def self.muse_options
        system "clear"
        puts "Please select ALL of your muses for this show:"
        puts "(example: 8,3,1,6,3,5)\n\n"
        all = Muse.all.map{|muse| muse.name}.uniq
        all.each_with_index {|muse, index| puts " #{index+1}. #{muse}"}
    end

    def self.desired_muses(list)
        muse_list = list
        needed_muses = muse_list.split(",")
        nm = needed_muses.map{|index| index.to_i - 1}
        fs_muses = nm.map{|index| Muse.muse_options[index]}
        nmo = fs_muses.map{|names| Muse.all.select{|muse| muse.name == names}}.flatten
    end
    #=> returns an ARRAY of MUSE OBJECTS

    def self.save_muses(list, fs_id)
        list.map do |muse|
            save_list = FashionShowMuse.new(fashion_show_id: fs_id, muse_id: muse.id)
            save_list.save
        end
    end

    def self.selected_muses(list)
        list.each_with_index{|name, index| puts "#{index+1}. #{name.name}"}
    end
    #=> prints a list of muse names with index

    def self.muse_list(fs_id)
        view_fs = fs_id
        fsm_object = FashionShowMuse.all.select{|shows| shows.fashion_show_id == view_fs}
        muse_list = fsm_object.map{|details| details.muse.name}
        muse_list.each_with_index{|name, index| puts "#{index+1}. #{name}"}
    end

    #=> returns an ARRAY of FashionShowMuse OBJECTS

end

