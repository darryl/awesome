class Sample < ActiveRecord::Base
  has_attached_file :audio

  validates_attachment :audio,
  :presence => true,
  :size => { greater_than: 0 }

  # supported codecs across different browsers still in a state of flux
  do_not_validate_attachment_file_type :audio

  belongs_to :musician
  has_many :mixes, through: :importages
  has_many :importages, dependent: :destroy
  has_many :libraries, through: :importages

  before_create :populate_empty_name

  def populate_empty_name
    if name.blank?
      self.name = self.audio_file_name
    end
  end
end
