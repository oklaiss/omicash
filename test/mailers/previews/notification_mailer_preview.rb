# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview

	def notification_email_preview
		NotificationMailer.notification_email(Notification.first, User.first)
	end

end
