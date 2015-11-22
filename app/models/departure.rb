class Departure < ActiveRecord::Base
  belongs_to :location
  belongs_to :trackable
end
