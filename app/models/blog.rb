class Blog < ApplicationRecord
    enum status: { draft: 0, published: 1 }
    extend FriendlyId
    friendly_id :title, use: :slugged
    
    validates_presence_of :title, :body

    # TODO: fix blog/topic relationship
    belongs_to :topic

  # dependent: :destroy will remove blog comments when blog record destroyed.
  has_many :comments, dependent: :destroy

    # this is a scope
    def self.special_blogs
        # all
        limit 3
    end

    def self.featured_blogs
        limit 2
    end
end
