class Topic < ApplicationRecord

    validates_presence_of :title
    has_many :blogs

    def self.with_blogs # using includes makes this query much more efficient
        includes(:blogs).where.not(blogs: { id: nil})
    end
end
