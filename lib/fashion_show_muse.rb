class FashionShowMuse < ActiveRecord::Base
    belongs_to :muse
    belongs_to :fashion_show
end