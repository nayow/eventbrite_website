class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :attendances
  has_many :events, through: :attendances

  after_create :welcome_send

  validates :first_name, presence: true
  validates :email, presence: true

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def show
    
  end

end
