class ImportLineWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'bulk_users', retry: false

  def perform(import_line_id)
    ImportLines::ProcessLineService.run(import_line_id)
  end
end
