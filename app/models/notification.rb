class Notification < ActiveRecord::Base
	belongs_to :user
	after_create :send_initial_notif

	def self.send_notifications
		self.find_each do |notification|
			# check if needs to be sent
			now = DateTime.current
			# thirty_ago = DateTime.current-5.minutes
			thirty_ago = DateTime.current-60.minutes
			created = notification.created_at.utc
			if notification.is_active
				# notification is active
				if notification.last_sent
					# notification has already been sent once
					time_to_send = notification.last_sent + notification.frequency.hours
					notification.push_notification_now if now >= time_to_send && thirty_ago <= time_to_send
				else
					# notification hasn't been sent yet
					if now >= notification.created_at.utc && thirty_ago <= notification.created_at.utc
						notification.push_notification_now
					else
						time_to_send = created + notification.frequency.hours
						notification.push_notification_now if now >= time_to_send && thirty_ago <= time_to_send
					end
				end

				# for testing
				# notification.push_notification_now

				notification.last_sent = DateTime.current
				notification.save!
				# calculate if notification should be marked as inactive
				# duration is **number of times a notif will be sent** (not days or hours)
				if now > notification.created_at.utc + (notification.duration).hours
					notification.is_active = false
					notification.save!
				end
			end
		end
	end

	# sends initial message only once (after_create)
	# we can get rid of the check in send_notifications because notifications will always have been intially sent
	def send_initial_notif
		self.last_sent = DateTime.current
		self.save!
		self.push_notification_now
	end

	def push_notification_now
		# Push ActiveMailer
		NotificationMailer.notification_email(self, self.user).deliver

		# make Twilio calls
		account_sid = 'ACb7ab149eb0706c444c6fe00f688c45de'
		auth_token = '99090f489e89597e5f58cda4adee0bef'
		to_number = self.phone_number
		message_body = self.message_text

		# set up a client to talk to the Twilio REST API
		@client = Twilio::REST::Client.new account_sid, auth_token

		@client.account.messages.create({
			:from => '+16503810319',
			:to => to_number,
			:body => message_body,
		})
	end

end
