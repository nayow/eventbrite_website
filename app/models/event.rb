class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :admin, class_name: 'User', foreign_key: 'admin_id'

  validates :title, presence: true, length: { in: 5..140 }
  validates :location, presence: true
  validates :start_date, presence: true, if: :start_date_cannot_be_in_the_past
  validates :description, presence: true, length: { in: 20..1000 }
  validates :duration, presence: true, if: :duration_must_be_multiple_of_5 
  validates :price, presence: true, inclusion: { in: 1..1000 }


  def start_date_cannot_be_in_the_past
		unless start_date && start_date > Date.today
      	errors.add(:start_date)
    end
  end
  
	def duration_must_be_multiple_of_5
		unless duration && duration % 5 == 0
		  errors.add(:duration)
		end
  end

end
