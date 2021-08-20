class ImportWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'bulk_users'

  def perform(import_id)
    Imports::ProcessImportService.run(import_id)
  end
end
