module ImportLines
  class CreateLinesService
    attr_accessor :params, :import_id

    def initialize(params, import_id)
      @params = params
      @import_id = import_id
    end

    def call
      create_line
    end

    private

    def create_line
      import_line = ImportLine.create(params.merge(import_id: import_id))
      create_user(import_line)
    end

    def create_user(import_line)
      User.create!(params)
    rescue ActiveRecord::RecordInvalid => e
      import_line.update_column(:error_message, e.record.errors.full_messages.join(','))
      raise e.message
    end
  end
end
