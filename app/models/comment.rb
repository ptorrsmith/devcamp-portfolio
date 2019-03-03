class Comment < ApplicationRecord

# these automatically adde by resource generator when we specified the references....
# rails g resource Comment content:text user:references blog:references
  belongs_to :user
  belongs_to :blog
end
