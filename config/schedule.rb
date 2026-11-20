# Cron jobs managed by the whenever gem.
# Preview the crontab: bundle exec whenever
# Install it on the server: bundle exec whenever --update-crontab
# Times follow the server time zone.

set :output, "log/cron.log"

every 1.day, at: "12:00 am" do
  runner "RemoveOldLoginsJob.perform_now"
end
