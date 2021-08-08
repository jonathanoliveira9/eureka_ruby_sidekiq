class ImportsController < ApplicationController
  def index
    @pagy, @imports = pagy(Import.order(created_at: :desc))
  end

  def new
    @import = Import.new
  end

  def create
    @import = Import.new(import_params)
    @import.in_progress!
    respond_to do |format|
      format.html { }
      ImportJob.perform_later(@import.id)
      redirect_to imports_path
    end
  end

  private

  def import_params
    params.require(:import).permit(:attachment_template)
  end
end
