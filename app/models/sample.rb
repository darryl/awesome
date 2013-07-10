class Sample < ActiveRecord::Base
  has_attached_file :audio

  belongs_to :musician
  has_many :mixes, :through => :importages
  has_many :importages
  has_many :libraries, :through => :importages ###

  def before_create
  ### if name is nil populate it with the filename
  end
end
