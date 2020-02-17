class User < ApplicationRecord
  has_many :attendances
  has_many :events, through: :attendances

  after_create :welcome_send

  validates :first_name, presence: true
  validates :email, presence: true

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
