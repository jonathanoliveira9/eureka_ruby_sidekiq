class ImportLineWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'bulk_users', retry: false

  def perform(import_line_id)
    ImportLines::ProcessLineService.new(import_line_id).run
  end
end
