class Musician < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :desc

  has_many :samples
  has_many :mixes
  has_one :library
  
  def before_create
    if library.nil?
      self.library = Library.create()
    end
  end
end
