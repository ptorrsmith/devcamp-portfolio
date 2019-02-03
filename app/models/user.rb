class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name

  def first_names
    # if self.name.split.length > 2
    #   self.name.split.first # split into array by space
    # else
      self.name.split.first # split into array by space
    # end
  end

  def last_name
    self.name.split.last

  end
end
