class Team < ApplicationRecord
    has_many :players

    def is_playoff_eligible(boolean)
        if boolean == true
            "Yes!"
        else
            "Unfortunately not."
        end
    end
end