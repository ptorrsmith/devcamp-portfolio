#modular code piece
module DefaultPageContentConcern # must match filename CapCasing > cap_casing.rb
    extend ActiveSupport::Concern

    included do 
        before_action :set_page_defaults
    end

    def set_page_defaults
        @page_title = 'Peter Torr Smith'
        @seo_keywords = 'Blog, ptorrsmith, portfolio, resume, cv, work experience'
    end

end
