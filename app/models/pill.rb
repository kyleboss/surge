class Pill < ActiveRecord::Base
  belongs_to :drug
  belongs_to :brand
  belongs_to :location
  belongs_to :hospital
end
