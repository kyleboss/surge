class User < ActiveRecord::Base
  belongs_to :address
  belongs_to :credit_card
end
