class Hospital < ActiveRecord::Base
  belongs_to :address
  has_many :users, :dependent => :destroy
  has_many :patients
  has_many :barcode_readers
  has_many :locations
  has_many :rfid_readers
  validates_presence_of :name
  validates_associated :address

end
