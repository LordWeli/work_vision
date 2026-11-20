# Used to remove old logins from the database
# This job is scheduled to run every day at 00:00 (midnight)

class RemoveOldLoginsJob < ApplicationJob
  queue_as :default

  RETENTION_PERIOD = 60.days

  def perform
    Login.where(created_at: ...RETENTION_PERIOD.ago).in_batches(of: 1_000).delete_all
  end
end
