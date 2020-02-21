class User < ApplicationRecord
  has_many :attendances
  has_many :events, through: :attendances
  has_many :admins, class_name: 'Event', foreign_key: 'event_id'
  has_one_attached :avatar

  validates :email, presence: true
  # after_create :welcome_send

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def is_admin_or_participant?(event)
    attendants_id = event.users.pluck('id')
    attendants_id.include?(self.id) || self.is_admin?(event)
  end

  def is_admin?(event)
    event.admin.id == self.id
  end

end
