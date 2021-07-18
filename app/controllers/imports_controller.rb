class ImportsController < ApplicationController
  def index
    @pagy, @imports = pagy(Import.order(created_at: :desc))
  end
end
