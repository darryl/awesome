class Mix < ActiveRecord::Base
  belongs_to :musician
  has_many :importages, dependent: :destroy
  has_many :samples, through: :importages
end
