class ImportsController < ApplicationController
  def index
    @pagy, @imports = pagy(Import.order(created_at: :desc))
  end

  def new
    @import = Import.new    
  end

  def create
    
  end

  private
end
