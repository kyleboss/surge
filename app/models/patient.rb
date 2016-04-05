class Patient < ActiveRecord::Base
  belongs_to :hospital
  has_many :trackables
  validates_associated :hospital
  validates_numericality_of :hospital_id, allow_nil: true
end
