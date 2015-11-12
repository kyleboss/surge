class User < ActiveRecord::Base
  include PasswordDigester
  belongs_to :address
  belongs_to :credit_card

  def authenticate(password)
    return PasswordDigester.check?(password, self.password);
  end
end
