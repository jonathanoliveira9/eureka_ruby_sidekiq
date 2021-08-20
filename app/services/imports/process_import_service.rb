module Imports
  class ProcessImportService
    attr_accessor :import, :errors

    def self.run(import_id)
      new(import_id).process
    end

    def initialize(import_id)
      @import = Import.find(import_id)
      @errors = []
    end

    def process
      create_lines
      import.success!
    rescue => e
      import.failed!
    end

    private

    def fetch_rows
      Imports::FetchRowsService.new(import: import).process
    end

    def header_file
      { first_name: 'First Name', last_name: 'Last Name', email: 'Email', phone: 'Phone' }
    end

    def create_lines
      fetch_rows.each(header_file) do |line|
        next if line.each_value.all? { |value| header_file.values.include?(value) }

        ImportLines::CreateLinesService.new(line, import.id).call
      end
    end
  end
end
