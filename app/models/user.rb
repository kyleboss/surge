class User < ActiveRecord::Base
  include PasswordDigester
  belongs_to :address
  belongs_to :hospital
  validates :password, length: { minimum: 6 }
  validates_associated :address, :hospital
  validates_presence_of :email, :password

  def authenticate(password)
    return PasswordDigester.check?(password, self.password);
  end

  def before_save(user)
    PasswordDigester.encrypt(user.password)
  end
end
