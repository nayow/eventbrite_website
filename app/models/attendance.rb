class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def self.retrieve_events_created_by(user_id)
    associated_events = Array.new
    Attendance.all.each do |attendance|
      if attendance.user_id  == user_id
        associated_events << Event.find(attendance.event.id)
      end
    end
    return associated_events
  end

end
