class GuestUser < User
    # attr_accessor :name, :first_name, :last_name, :email

    # added :id so warden can find an id
    attr_accessor :name, :first_name, :last_name, :email, :id
end
