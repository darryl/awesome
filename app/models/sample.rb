class Sample < ActiveRecord::Base
  has_attached_file :audio

  belongs_to :musician
  has_many :mixes, :through => :importages
  has_many :importages
  has_many :libraries, :through => :importages

  before_create :populate_empty_name

  def populate_empty_name
    if name.blank?
      self.name = self.audio_file_name
    end
  end
end
