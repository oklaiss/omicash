# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# set dev environment
set :environment, "development"

# Example:
#
set :output, "log/cron.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# every :hour do (was previous)
every 60.minutes do
	runner "Notification.send_notifications"
end

# run commands to update crontab after changes
# bundle exec whenever (checks schedule.rb in converted syntax)
# bundle exec whenever -i (update crontab)