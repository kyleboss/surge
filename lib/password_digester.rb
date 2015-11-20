require 'gibberish'

module PasswordDigester
  def self.encrypt(password)
    Gibberish::SHA1(password)
  end

  def self.check?(password, encrypted_password)
    print "PASSWORD: "
    print Gibberish::SHA1(password)
    print "ENCRYPTED: "
    print Gibberish::SHA1(encrypted_password)
    encrypted_password == Gibberish::SHA1(password)
  end
end