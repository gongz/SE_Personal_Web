class User < ActiveRecord::Base


  has_many :routine, :foreign_key => "user_id",
                           :dependent => :destroy
  has_many :dance, :through => :routine, :source => :dance

  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name,  :presence => true,
                    :length => {:maximum => 50},
                     :uniqueness => true
  validates :email, :presence => true,
                    :format   => { :with => email_regex },
                     :uniqueness =>true
  validates :password, :presence     => true,
                       :confirmation => true,
                       :length       => { :within => 6..40 }
  before_save :encrypt_password



    def has_password?(submitted_password)
      encrypted_password == encrypt(submitted_password)
    end

    class << self


    def authenticate(email, submitted_password)
      user = find_by_email(email)
      (user && user.has_password?(submitted_password)) ? user : nil
    end

    def authenticate_with_salt(id, cookie_salt)
      user = find_by_id(id)
      (user && user.salt == cookie_salt) ? user : nil
    end
    end

   def add_dance!(dance,number)
    routine.create!(:dance_id => dance.id, :routine_number => number)
  end

  def del_dance!(routine)
    routine.destroy
  end

  private

    def encrypt_password
      self.salt = make_salt unless has_password?(password)
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end
