class Comment < ApplicationRecord

# these automatically adde by resource generator when we specified the references....
# rails g resource Comment content:text user:references blog:references
  belongs_to :user
  belongs_to :blog

  # min and max is characters
  validates :content, presence: true, length: {minimum:5, maximum:1000}
end
