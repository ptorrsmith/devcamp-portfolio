class Skill < ApplicationRecord

    # this was built but not used initially. Now using carrierwave with aws, so removed.

    # include PlaceholderImage
    # validates_presence_of :title, :percent_utilized

    # after_initialize :set_defaults

    # def set_defaults
    #     self.badge ||= PlaceholderImage.image_generator(height: '200', width: '200')
    # end
end
