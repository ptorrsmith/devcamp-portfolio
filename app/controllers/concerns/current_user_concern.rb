#modular code piece
module CurrentUserConcern # must match filename CapCasing > cap_casing.rb
    extend ActiveSupport::Concern

    def current_user
        super || guest_user
    end

    def guest_user
        OpenStruct.new(
            name: "Guest visitor",
            first_names: "Guesty",
            last_name: "visitori",
            email: "x@y.z"
            )
    end
end
