class ImportJob < ApplicationJob
  queue_as :bulk_users

  def perform(import_id)
    Imports::ProcessImportService.run(import_id)
  end
end
