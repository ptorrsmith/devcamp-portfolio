class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: %i[site_admin editor], multiple: false) ##
  ############################################################################################

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name

  # dependent: :destroy will remove user comments when user record destroyed.
  has_many :comments, dependent: :destroy

  def first_names
    # if self.name.split.length > 2
    #   self.name.split.first # split into array by space
    # else
    name.split.first # split into array by space
    # end
  end

  def last_name
    name.split.last
  end
end
