class CommentsController < ApplicationController

    # no views for comments, as these are parts of other views (blog, user)
    def create
        # automatically associates comment with user (and blog supplied in params?)
        @comment = current_user.comments.build(comment_params)
    end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end

end
