class Hospital < ActiveRecord::Base
  belongs_to :address
  belongs_to :user

  def self.set_current_hospital(new_value)
    @@current_hospital = new_value
  end
end
