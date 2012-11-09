class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class User < ActiveRecord::Base
  # attr_accessible is used after rails3.2.8 because attributes is protected. Before 3.2.8, all attributes are public and need not use attr_accessible.
  attr_accessible :email, :name, :passwd
  validates :email, :uniqueness => true, :length => { :in => 9..36 }, :email => true  
  validates :name, :length => { :in => 3..16 }
  validates :passwd, :length => { :in => 6..100 }
  
#  def self.login(name, password)
#    hashed_password = hash_password(password || "")
#    find(:first,
#      :conditions => ["name = ? and hashed_password = ?",
#        name, hashed_password])
#  end
#  def try_to_login
#    User.login(self.name, self.passwd)
#  end
end




