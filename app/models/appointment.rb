class Appointment < ApplicationRecord
  include SlackNotification

	validates :name, :number, :time, presence: true
	validates :name, length: { minimum: 3 } # or { maximum: 500 } or { in: 6..20 } or { is: 6 } 
	validates :number, uniqueness: true, length: { is: 10 }

	after_create :reminder

	def reminder
		time_str = ((self.time).localtime).strftime("%I:%M%p on %b. %d, %Y")
		message = "Hi #{self.name}. Just a reminder that you have an appointment coming up at #{time_str}."
		p message
		slack_data = { message: message }
		sendNotification(slack_data)
	end

	def when_to_run
		minutes_before_appointment = 1.minutes
		time - minutes_before_appointment
	end

	handle_asynchronously :reminder, :run_at => Proc.new { |i| i.when_to_run }

end
