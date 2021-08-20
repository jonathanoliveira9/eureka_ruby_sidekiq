module ImportLines
  class ProcessLineService
    attr_accessor :import_line, :import

    def self.run(import_line_id)
      new(import_line_id).call
    end

    def initialize(import_line_id)
      @import_line = ImportLine.find(import_line_id)
      @import = @import_line.import
    end

    def call
      create_user
      handle_status_import!
    end

    private

    def create_user
      User.create!(params)
      import_line.update_column(:error_message, nil)
    rescue ActiveRecord::RecordInvalid => e
      import_line.update_column(:error_message, e.record.errors.full_messages.join(','))
      raise e.message
    end
    
    def params
      build_attributes = import_line.attributes
      reject_attr = %w(id error_id import_id error_message created_at updated_at string)
      build_attributes.reject! {|attr| attr.in?(reject_attr) }
    end

    def handle_status_import!
      import.success! if import.import_lines.all?{ |line| line.error_message.blank? }
    end
  end
end