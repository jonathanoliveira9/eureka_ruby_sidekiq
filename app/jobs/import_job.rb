class ImportJob < ApplicationJob
  queue_as :bulk_users

  def perform(import_id)
    
  end
end
