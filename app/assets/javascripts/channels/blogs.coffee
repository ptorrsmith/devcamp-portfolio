jQuery(document).on 'turbolinks:load', -> 
    comments = $('#comments')
    if comments.length > 0 
        App.global_chat = App.cable.subscriptions.create {
            channel: "BlogsChannel"
            blog_id: comments.data('blog-id')
        },
        connected: ->
        disconnected: ->
        received: (data) ->
            comments.append data['comment']
        send_comment: (comment, blog_id) ->
        # @perform is a special action cable variable
            @perform 'send_comment', comment: comment, blog_id
    $('#new_comment').submit (e) ->
        $this = $(this) # instance of this event so we can work with its data
        textarea = $this.find('#comment_content')
        if $.trim(textarea.val()).length > 1 # ensure not empty
            App.global_chat.send_comment textarea.val(), comments.data('blog-id')
            textarea.val('')
        e.preventDefault()  #not sure I need this if using form_with ???? have set local: true for now on that form to emulate old approach and to work with this js
        return false