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
      ImportLine.create(params)
    end
  end
end
