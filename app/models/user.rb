class User < ActiveRecord::Base

  has_many :reviews
  
  has_secure_password

  validates :password, length: {minimum: 5}
  validates :password_confirmation, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  def authenticate_with_credentials email, password
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
    else
      nil
    end
    
  end
end
