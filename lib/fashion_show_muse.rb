class FashionShowMuse < ActiveRecord::Base
    belongs_to :muse
    belongs_to :fashion_show

    def self.existing_list(info)
        fs_object = info
        FashionShow.fs_details(fs_object)
    
        puts "Muses for this show:"
        fs_id = info.id
        Muse.muse_list(fs_id)
    end

end