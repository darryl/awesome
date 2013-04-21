class Importage < ActiveRecord::Base
  belongs_to :mixes
  belongs_to :sample
  belongs_to :library
end
