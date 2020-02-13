class Muse < ActiveRecord::Base
    has_many :fashion_show_muses
    has_many :fashion_shows, through: :fashion_show_muses
end

