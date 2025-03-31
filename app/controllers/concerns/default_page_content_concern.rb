# modular code piece
module DefaultPageContentConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = 'Peter Torr Smith - Product Owner, Analyst, Engineer, Delivery focus'
    @seo_keywords = 'resume, cv, work experience'
  end
end
