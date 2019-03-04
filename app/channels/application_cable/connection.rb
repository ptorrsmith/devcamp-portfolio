module ApplicationCable
  class Connection < ActionCable::Connection::Base
    #  provides info to our channel, including the current user. VERY IMPORTANT
    #  ActionCable/websockets don't have same access points to HTTP connection, they have diff set or parameters: websockets vs HTTP
    #  Recreate the current_user method, as websockets not know current user.
    identified_by :current_user

    # warden / websockets / channels not have access to many things, so need to make own guest user method and verified user method
    def guest_user
      guest = GuestUser.new
      guest.id = guest.object_id # object_id is in memory and should be unique, so good proxy for non-logged-in user
      guest.name = "Guest User"
      guest.first_name = "Guest"
      guest.last_name = "User"
      guest.email = "guest@user.com"
      guest
    end
    
    def connect
      
      # binding.pry
      
      self.current_user = find_verified_user || guest_user
      logger.add_tags 'ActionCable', current_user.email
      logger.add_tags 'ActionCable', current_user.id
    end

    protected

    def find_verified_user
      
      # binding.pry
      
      if verified_user = env['warden'].user # warden helps bridge websockets comms through devise?
        
        # binding.pry
        
        verified_user
      end
    end

  end
end
