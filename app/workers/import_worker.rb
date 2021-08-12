class ImportWorker
  include Sidekiq::Worker

  def perform(import_id)
    Imports::ProcessImportService.run(import_id)
  end
end
