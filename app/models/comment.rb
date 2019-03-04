class Comment < ApplicationRecord

# these automatically adde by resource generator when we specified the references....
# rails g resource Comment content:text user:references blog:references
  belongs_to :user
  belongs_to :blog

  # min and max is characters
  validates :content, presence: true, length: {minimum:5, maximum:1000}

    # callback. Why not after_save ??? or if .save!
    after_create_commit {
        CommentBroadcastJob.perform_later(self) # queues this for asynch action... queues in redis no-sql db / name: value document store
    }
end
