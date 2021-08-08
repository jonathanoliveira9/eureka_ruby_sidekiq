class ImportLinesController < ApplicationController
  before_action :import_line, only: %i[edit]

  def index
    @import_lines = ImportLine.by_import(params[:import_id])
  end

  def edit; end

  def update; end

  private

  def import_line
    @import_line = ImportLine.find(params[:id])
  end

  def params_import_lines
    params.require(:import_lines).permit(:last_name, :first_name, :email, :phone, :id)
  end
end
