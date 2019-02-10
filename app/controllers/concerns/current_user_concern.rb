#modular code piece
module CurrentUserConcern # must match filename CapCasing > cap_casing.rb
    extend ActiveSupport::Concern

    def current_user
        super || guest_user
    end

    # As it was before petergate and crating GuestUser class inheriting from User (which includes petergate)

    # def guest_user
    #     OpenStruct.new(
    #         name: "Guest visitor",
    #         first_names: "Guesty",
    #         last_name: "visitori",
    #         email: "x@y.z"
    #         )
    # end

    def guest_user
        guest = GuestUser.new
        guest.name = "friend"
        guest.first_name = "Visitor"
        guest.last_name = "User"
        guest.email = "guest@ptorrsmith.com"
        
        # return guest
        guest
    end


end
