class Address < ActiveRecord::Base
  validates_presence_of :street_address, :state, :city, :zip_code, :country
  validates_numericality_of :zip_code
  has_one :hospital
  has_many :users

  def self.find_or_create_by_address_id(address_info)
    street_address  = address_info[:street_address]
    city            = address_info[:city]
    state           = address_info[:state]
    zip_code        = address_info[:zip_code]
    country         = address_info[:country]

    return Address.find_or_create_by(:street_address => street_address,
                                     :city => city,
                                     :state => state,
                                     :zip_code => zip_code,
                                     :country => country).id
  end
end