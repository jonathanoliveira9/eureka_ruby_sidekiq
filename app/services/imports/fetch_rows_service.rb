module Imports
  class FetchRowsService
    attr_accessor :import

    def initialize(import:)
      @import = import
    end

    def process
      fetch_rows
    end

    private

    def fetch_rows
      tempfile = Tempfile.new(import.attachment_template.filename.to_s)
      tempfile.binmode
      tempfile.write(import.attachment_template.download)
      tempfile.close
      rows = Roo::Spreadsheet.open(tempfile.path, extension: :xlsx)
      tempfile.unlink
      rows
    end
  end
end
