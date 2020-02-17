class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances

  # validates :start_date, presence: true
  # validates :duration, presence: true, if -> {duration>0 && duration%5==0}
  # validates :title, presence: true, length: { in: 5..140 }
  # validates :description, presence: true, length: { in: 20..1000 }
  # validates :price, presence: true, if -> {[1..1000].include?.price}
  # validates :location, presence: true

end
