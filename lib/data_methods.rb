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

def helpful_things
    system "clear"
    puts "Enter '99' for the MAIN MENU."
    puts "Enter '0' to EXIT.\n\n"
end

############################################################################
###########################  1. CREATE   ###################################
############################################################################

def schedule_fashion_show
    system "clear"
    puts "Create a Fashion Show:\n\n"
    FashionShow.season_options
    
    new_fashion_show = FashionShow.new()
    new_fashion_show.season = FashionShow.season_string(user_input)

    Designer.designer_options
    new_fashion_show.designer_options = Designer.desired_designer(user_input)


    # system "clear"
    # puts "Please enter a designer name:"
    # # designer_options
    # designer = desired_designer(user_input)
    # schedule.designer = Designer.find_by(name: designer)

    check = FashionShow.all.find do |show| 
        show.designer == schedule.designer && show.season == schedule.season
    end

    # binding.pry

    if FashionShow.all.include?(check)
        system "clear"
        puts "Sorry, that fashion show already exists!"
        puts "\n\n\nWould you like to do anything else?\n\n"
        main_menu
        engage_with_user
        return
    else
        schedule.save 
    end  
    
    system "clear"
    puts "Please select ALL of your muses for this show:"
    puts "(example: 8,3,1,6,3,5)\n\n"
    muse_options
    list = gets.chomp
    needed_muses = list.split(",")
    nm = needed_muses.map{|index| index.to_i - 1}
    fs_muses = nm.map{|index| muse_options[index]}
    nmo = fs_muses.map{|names| Muse.all.select{|muse| muse.name == names}}.flatten

    this = nmo.each do|mo|
        nfsmo = FashionShowMuse.new(fashion_show_id: schedule.id, muse_id: mo.id)
        nfsmo.save
    end

    system "clear"
    puts "Got it! Your #{schedule.season} Fashion Show has been created!"
    puts "with #{designer} as your Designer!\n\n"
    puts "Fashion Show id#: #{schedule.id}"
    puts "Designer: #{schedule.designer.name}"
    puts "Season: #{schedule.season}\n\n"
    puts "Muses for this show:"
    fs_muses.each_with_index{|name, index| puts "#{index+1}. #{name}"}

    puts "\n\n\nWould you like to do anything else?\n\n"
    main_menu
    engage_with_user
end 

# def season_options
#     all = FashionShow.all.map{|show| show.season}.uniq
#     all.each_with_index {|season, index| puts " #{index+1}. #{season}"}
# end

# def season_string(user_input)
#     ds = season_options[user_input - 1]
#     ds
# end

# def designer_options
#     all = Designer.all.map{|designer| designer.name}.uniq
#     all.each_with_index {|designer, index| puts " #{index+1}. #{designer}"}
# end

# def desired_designer(user_input)
#     dd = designer_options[user_input - 1]
#     dd
# end

def muse_options
    all = Muse.all.map{|muse| muse.name}.uniq
    all.each_with_index {|muse, index| puts " #{index+1}. #{muse}"}
end

############################################################################
###########################  2. UPDATE   ###################################
############################################################################
def update_info
    system "clear"
    puts "Update a Fashion Show:\n\n"
    FashionShow.season_options
    s_string = FashionShow.season_string(user_input)
    fs_object = FashionShow.desired_season(s_string)
    
    Designer.designers_by_season(fs_object)
    d_object = fs_object[user_input-1]
    # binding.pry
    

end


############################################################################
##############################  3. READ  ###################################
############################################################################

def show_info
    system "clear"
    puts "View Fashion Show Details:\n\n"

    puts "Do you know the Fashion Show's id you want to see?"
    puts "1. Yes"
    puts "2. Nope!"
    case(user_input)
    when 1
        view_fs_by_id
        return
    when 2
        view_fs_by_season
    end

    puts "Would you like to do anything else?\n\n"
    main_menu
    engage_with_user
end

def view_fs_by_id
    system "clear"
    puts "Please enter the Fashion Show id:"
    fs_id = gets.chomp.to_i

    fs_details = FashionShow.all.find{|shows| shows.id == fs_id}
    system "clear"

    puts "Here are your details for that show:\n\n"
    puts "Fashion Show id# #{fs_id}"
    puts "Designer: #{fs_details.designer.name}"
    puts "Season: #{fs_details.season}\n\n"

    fsm_details = FashionShowMuse.all.select{|shows| shows.fashion_show_id == fs_id}
    muse_list = fsm_details.map{|details| details.muse.name}
    puts "Muses for this show:"
    muse_list.each_with_index{|name, index| puts "#{index+1}. #{name}"}
    puts"\n\n\n"
end


##### TEST  ####


def view_fs_by_season
    system "clear"
    puts "View Fashion Show Details by Season:\n\n"
    FashionShow.season_options
    s_string = FashionShow.season_string(user_input)
    fs_object = FashionShow.desired_season(s_string)
    
    Designer.designers_by_season(fs_object)
    d_object = fs_object[user_input-1]


    


    system "clear"
    puts "Please select which fashion show to view:"
    specified_season = FashionShow.select_season(edit_season)
    
    fashion_show = specified_season.map{|show| show.designer.name}
    fashion_show.each_with_index{|designer, index| puts "#{index+1}. #{designer}"}
    view_show = user_input
    vs = fashion_show[view_show-1]
    fs_details = specified_season.find{|show| show.designer.name == vs}
  
    system "clear"
    puts "Here are your details for that show:\n\n"
    puts "Fashion Show id# #{fs_details.id}"
    puts "Designer: #{vs}"
    puts "Season: #{fs_details.season}\n\n"
    
    fs_id = fs_details.id
    fsm_details = FashionShowMuse.all.select{|shows| shows.fashion_show_id == fs_id}
    muse_list = fsm_details.map{|details| details.muse.name}

    puts "Muses for this show:"
    muse_list.each_with_index{|name, index| puts "#{index+1}. #{name}"}
    puts"\n\n\n"
    
end


### END TEST ###


############################################################################
###########################  4. CANCEL   ###################################
############################################################################

def cancelled_plans
    system "clear"
    puts "Cancel a Fashion Show:\n\n"
    FashionShow.season_options
    s_string = FashionShow.season_string(user_input)
    fs_object = FashionShow.desired_season(s_string)
    
    Designer.designers_by_season(fs_object)
    d_object = fs_object[user_input-1]
    
    binding.pry
    

    edit_season =  season_string(user_input)

    system "clear"
    puts "Please select which fashion show to cancel:"
    specified_season = select_season(edit_season)
    
    fashion_show = specified_season.map{|show| show.designer.name}
    fashion_show.each_with_index {|designer, index| puts " #{index+1}. #{designer}"}
    cancelled = user_input
    cs = fashion_show[cancelled-1]
    updated_season = specified_season.reject{|show| show.designer.name == cs}

    system "clear"
    puts "You've cancelled the #{edit_season} show for #{cs}. \n\n\n"
    
   
    puts "Would you like to do anything else?\n\n"
    main_menu
    engage_with_user
end

# def select_season(edit_season)
#     FashionShow.all.select{|show| show.season == edit_season}
# end
