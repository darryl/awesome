class Musician < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :recoverable, 
  # :lockable, :timeoutable and :omniauthable 
  devise :database_authenticatable, :registerable,
    :rememberable, :trackable, :validatable

  has_many :samples
  has_many :mixes
  has_one :library

  before_create :setup_library
  
  def name
    email.split('@')[0]
  end
  
  private
  def setup_library
    if library.nil?
      self.library = Library.create()
    end
  end
end
