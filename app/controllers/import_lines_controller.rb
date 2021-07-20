class ImportLinesController < ApplicationController
  def index
    @import_lines = ImportLine.by_import(params[:import_id])
  end
end
