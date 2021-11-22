module ImportLines
  class ProcessLineService
    attr_accessor :import_line, :import

    def initialize(import_line_id)
      @import_line = ImportLine.where(id: import_line_id).last
      @import = @import_line.import
    end

    def run
      create_user
    end

    private

    def params
      attrs_delete = %w[created_at updated_at id error_message]
      import_line.attributes.reject { |attr| attrs_delete.any? { |a| a.eql?(attr) } }
    end

    def create_user
      Users::CreateService.new(params).run
      import_line.update_column(:error_message, nil)
      update_status_import
    rescue ActiveRecord::RecordInvalid => e
      import_line.update_column(:error_message, e.record.errors.full_messages.join(','))
      raise e.message
    end

    def update_status_import
      import.success! if import.import_lines.all? { |line| line.error_message.blank? }
    end
  end
end
