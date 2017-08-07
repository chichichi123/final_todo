class User < ActiveRecord::Base
  has_secure_password


  has_many :authentications, dependent: :destroy
  has_many :todo_lists

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :email, uniqueness: true



  # enum role: [:customer, :admin]


  def self.create_with_auth_and_hash(authentication, auth_hash)
    user = self.create!(
      name: auth_hash["name"],
      email: auth_hash["extra"]["raw_info"]["email"],
      password: SecureRandom.hex(4)
    )
    user.authentications << authentication
    return user
  end

  # grab fb_token to access Facebook for user data
  def fb_token
    x = self.authentications.find_by(provider: 'facebook')
    return x.token unless x.nil?
  end

end
