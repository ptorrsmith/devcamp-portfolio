class Blog < ApplicationRecord
    enum status: { draft: 0, published: 1 }
    extend FriendlyId
    friendly_id :title, use: :slugged
    
    validates_presence_of :title, :body
    validates_presence_of :topic_id, message: 'Please select a topic'

    # TODO: fix blog/topic relationship, as seems to imply topic is required (gives error)
    belongs_to :topic  #, optional: true # this causes a double error, on this and on the validation :-(

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

    def self.recent
        order('created_at DESC')
    end
end
