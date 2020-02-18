class User < ApplicationRecord
  has_many :attendances
  has_many :events, through: :attendances
  has_many :admins, class_name: 'Event', foreign_key: 'event_id'

  validates :email, presence: true
  after_create :welcome_send

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
