class ImportJob < ApplicationJob
  queue_as :bulk_users

  def perform(*args)
    
  end
end
