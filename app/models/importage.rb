class Importage < ActiveRecord::Base
  belongs_to :mix
  belongs_to :sample
  belongs_to :library
end
