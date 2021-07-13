class WelcomeController < ApplicationController
  def index; end

  def dispatch_mail
    respond_to do |format|
      format.html { redirect_to :root }
    end
  end
end