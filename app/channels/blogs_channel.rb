class BlogsChannel < ApplicationCable::Channel

    def subscribed
        # binding.pry
        # channels are streams
        stream_from "blogs_#{params['blog_id']}_channel"

    end

    def unsubscribed 
        # binding.pry
        # user left the page
    end

    def send_comment(data)
        # just like you would do in the rails console :-)
        # binding.pry
        current_user.comments.create!(content: data['comment'], blog_id: data['blog_id'])
    end


end
