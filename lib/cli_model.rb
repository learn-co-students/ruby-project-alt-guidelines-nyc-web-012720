def greet
    puts "Why hello there my favorite fashionista!"
    puts "What brings you in today?\n\n"
end 
    
def main_menu
    puts "Main Menu - Enter a number:\n\n"
    puts "1. Create a fashion show."
    puts "2. Update some details."
    puts "3. View fashion details!"
    puts "4. Sadly cancel a show."
    puts "0. Nevermind, I got pulled into a meeting!\n\n"
end

def user_input
    gets.chomp.to_i 
end

def exit_out
    system "clear"
    puts "Have a lovely day my fashionista!"
    puts "You're making fabulous things happen out there!\n\n\n\n"
end

def engage_with_user
    case(user_input)
    when 1
        schedule_fashion_show
    when 2
        update_info
    when 3
        show_info
    when 4
        cancelled_plans
    when 0
        exit_out
        return
    end
end

def go_to_main_menu
    main_menu
    engage_with_user
end

def loop_to_main_menu
    puts "\n\n\nWould you like to do anything else?\n\n"
    go_to_main_menu
end


def seach_by_id_or_season
    puts "Do you know the Fashion Show's id you want to see?"
    puts "1. Yes"
    puts "2. Nope!"
end

############################################################################
###########################  1. CREATE   ###################################
############################################################################

def schedule_fashion_show
    system "clear"
    puts "Create a Fashion Show:\n\n"
    
    new_fs = FashionShow.new()
    
    FashionShow.season_options
    new_fs.season = FashionShow.season_string(user_input)

    Designer.designer_options
    new_fs.designer = Designer.all[user_input - 1]
  
    check = FashionShow.all.find do |show| 
        show.designer == new_fs.designer && show.season == new_fs.season
    end

    if FashionShow.all.include?(check)
        duplicating_fashion_show
        return
    else
        new_fs.save 
    end  

    Muse.muse_options
    list = Muse.desired_muses(gets.chomp)
    Muse.save_muses(list, new_fs.id)
   
    system "clear"
    puts "Got it! Your #{new_fs.season} Fashion Show has been created!"
    puts "with #{new_fs.designer.name} as your Designer!\n\n"
    
    puts "Fashion Show id#: #{new_fs.id}"
    puts "Designer: #{new_fs.designer.name}"
    puts "Season: #{new_fs.season}\n\n"
    
    puts "Muses for this show:"
    Muse.selected_muses(list)

    loop_to_main_menu
end 

def duplicating_fashion_show
    system "clear"
    puts "Sorry, that fashion show already exists!"
    loop_to_main_menu
end

############################################################################
###########################  2. UPDATE   ###################################
############################################################################
def update_info
    system "clear"
    puts "Update Fashion Show Details:\n\n"

    seach_by_id_or_season
    case(user_input)
    when 1
        update_fs_by_id
        return
    when 2
        update_fs_by_season
    end
end

def update_fs_by_id
    info =  FashionShow.view_by_id
    FashionShowMuse.existing_list(info)
    new_options = Muse.muse_options - FashionShowMuse.existing_list(info)

    puts "\n\nWould you like to add or remove a muse?\n\n"
    puts "1. Add"
    puts "2. Remove\n\n"

    case(user_input)
    when 1
        system "clear"
        puts "Which muse(s) would you like to add?\n\n"
        new_options = new_options.each_with_index{|name, index| puts " #{index+1}. #{name}"}

        add_to_list = gets.chomp
        needed_muses = add_to_list.split(",")
        nm = needed_muses.map{|index| index.to_i - 1}
        need_objects = nm.map{|index| new_options[index]}
        list = need_objects.map{|string| Muse.all.find_by(name: string)}
        Muse.save_muses(list, info.id)
        
        system "clear"
        FashionShowMuse.existing_list(info)
        puts "\n\nThe muse list has been updated!\n\n"
        
        loop_to_main_menu
        return
    when 2
        system "clear"
        puts "Which muse would you like to remove?\n\n"
        puts "Please note that you can only remove one muse at a time."
        muse_list = Muse.muse_list(info.id)
        
        index = user_input - 1
        
        muse_name = muse_list[index]
        muse_id = Muse.all.find_by(name: muse_name).id
        FashionShowMuse.all.find_by(fashion_show_id: info.id, muse_id: muse_id).destroy
        system "clear"
        FashionShowMuse.existing_list(info)
        puts "\n\nThe muse list has been updated!\n\n"
        loop_to_main_menu
        return
    end
end

def update_fs_by_season
    system "clear"
    FashionShow.season_options
    s_string = FashionShow.season_string(user_input)

    fs_object = FashionShow.desired_season(s_string)

    Designer.designers_by_season(fs_object)
    index = user_input - 1
    info = fs_object[index] 
    FashionShowMuse.existing_list(info)
    new_options = Muse.muse_options - FashionShowMuse.existing_list(info)

    puts "\n\nWould you like to add or remove a muse?\n\n"
    puts "1. Add"
    puts "2. Remove\n\n"

    case(user_input)
    when 1
        system "clear"
        puts "Which muse(s) would you like to add?\n\n"
        new_options = new_options.each_with_index{|name, index| puts " #{index+1}. #{name}"}

        add_to_list = gets.chomp
        needed_muses = add_to_list.split(",")
        nm = needed_muses.map{|index| index.to_i - 1}
        need_objects = nm.map{|index| new_options[index]}
        list = need_objects.map{|string| Muse.all.find_by(name: string)}
        Muse.save_muses(list, info.id)
        
        system "clear"
        FashionShowMuse.existing_list(info)
        puts "\n\nThe muse list has been updated!\n\n"
        
        loop_to_main_menu
        return
    when 2
        system "clear"
        puts "Which muse would you like to remove?"
        puts "NOTE: You can only remove one muse at a time.\n\n"
        muse_list = Muse.muse_list(info.id)
        
        index = user_input - 1
        
        muse_name = muse_list[index]
        muse_id = Muse.all.find_by(name: muse_name).id
        FashionShowMuse.all.find_by(fashion_show_id: info.id, muse_id: muse_id).destroy
        system "clear"
        FashionShowMuse.existing_list(info)
        puts "\n\nThe muse list has been updated!\n\n"
        loop_to_main_menu
        return
    end
end


############################################################################
##############################  3. READ  ###################################
############################################################################

def show_info
    system "clear"
    puts "View Fashion Show Details:\n\n"

    seach_by_id_or_season
    case(user_input)
    when 1
        view_fs_by_id
        return
    when 2
        view_fs_by_season
        loop_to_main_menu
    end
end

def view_fs_by_id
    info =  FashionShow.view_by_id
    FashionShowMuse.existing_list(info)
    loop_to_main_menu
end


def view_fs_by_season
    system "clear"
    puts "View Fashion Show Details by Season:\n\n"
    FashionShow.season_options
    s_string = FashionShow.season_string(user_input)

    fs_object = FashionShow.desired_season(s_string)
    
    Designer.designers_by_season(fs_object)

    index = user_input - 1
    info = fs_object[index] 
    FashionShowMuse.existing_list(info)
end

############################################################################
###########################  4. CANCEL   ###################################
############################################################################

def cancelled_plans
    system "clear"
    puts "Cancel a Fashion Show:\n\n"

    seach_by_id_or_season
    case(user_input)
    when 1
        system "clear"
        puts "Please enter the Fashion Show id:"
        info = user_input
        d_object = FashionShow.all.find_by(id: info)
        FashionShowMuse.existing_list(d_object)
        puts "\n\n.:! ! ! ! W A R N I N G ! ! ! !:..\n\n"
        puts "ARE YOU SURE YOU WANT TO CANCEL?"
        puts "ONCE CANCELLED, YOU WILL NOT BE ABLE TO UNDO\n\n"
        puts "1. Yes"
        puts "2. No"
        case(user_input)
        when 1
            FashionShow.destroy(info)
            system "clear"
            puts "The show was successfully cancelled."
            loop_to_main_menu
            return
        when 2
            system "clear"
            puts "No fashion shows were cancelled."
            loop_to_main_menu
            end
        return
    when 2
        system "clear"
        FashionShow.season_options
        s_string = FashionShow.season_string(user_input)
        fs_object = FashionShow.desired_season(s_string)
        
        Designer.designers_by_season(fs_object)
        d_object = fs_object[user_input-1]

        info = d_object.id

        FashionShowMuse.existing_list(d_object)
        puts "\n\n.:! ! ! ! W A R N I N G ! ! ! !:..\n\n"
        puts "ARE YOU SURE YOU WANT TO CANCEL?"
        puts "ONCE CANCELLED, YOU WILL NOT BE ABLE TO UNDO\n\n"
        puts "1. Yes"
        puts "2. No"

        case(user_input)
        when 1
            FashionShow.destroy(info)
            system "clear"
            puts "The show was successfully cancelled."
            loop_to_main_menu
            return
        when 2
            system "clear"
            puts "No fashion shows were cancelled."
            loop_to_main_menu
        end
    end 
end

