class ImportLinesController < ApplicationController
  before_action :find_import_line, only: %i[edit]

  def index
    @import_lines = ImportLine.by_import(params[:import_id])
  end

  def edit; end

  def update
    @import_line = ImportLine.find(params[:id])
    @import_line.assign_attributes(params_import_lines)
    respond_to do |format|
      if @import_line.save
        format.html
        redirect_to import_import_lines_path(@import_line.import)
      else
        render :edit
      end
    end
  end

  private

  def find_import_line
    @import_line = ImportLine.find(params[:id])
  end

  def params_import_lines
    params.require(:import_line).permit(:last_name, :first_name, :email, :phone)
  end
end
