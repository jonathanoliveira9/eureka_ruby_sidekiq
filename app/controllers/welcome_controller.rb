class WelcomeController < ApplicationController
  def index; end

  def dispatch_mail
    respond_to do |format|
      VisitorMailer.contact_mail(params[:name], params[:email], params[:message]).deliver_now
      format.html { redirect_to :root }
    end
  end
end