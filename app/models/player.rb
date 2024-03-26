class Player < ApplicationRecord
    belongs_to :team

    def is_a_champion(boolean)
        if boolean == true
            "Yes!"
        else
            "Unfortunately not."
        end
    end
end