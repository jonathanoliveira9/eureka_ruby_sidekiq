class ImportsController < ApplicationController
  def index
    @imports = Import.where('true')
  end
end
