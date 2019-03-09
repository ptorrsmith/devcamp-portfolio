class Topic < ApplicationRecord

    validates_presence_of :title
    has_many :blogs

    def self.with_blogs # using includes makes this query much more efficient
        includes(:blogs).where.not(blogs: { id: nil})
    end

    #  the above is same as 
    #  includes(:blogs).where.not("blogs.id = ?", nil)

    def self.with_published_blogs # using includes makes this query much more efficient
        includes(:blogs).where.not(blogs: { id: nil}, blogs: { status: 1})
    end

end


