class Sample < ActiveRecord::Base
  has_attached_file :audio

  belongs_to :musician
  has_many :mixes, :through => :importages
  has_many :importages
  has_many :libraries, :through => :importages
end
