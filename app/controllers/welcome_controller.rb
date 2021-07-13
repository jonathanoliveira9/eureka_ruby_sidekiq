class WelcomeController < ApplicationController

  def index; end

  def dispatch_mail
    respond_to do |format|
      (params['mail']['quantity'].to_i || 1).times do |t|
        VisitorJob.perform_later(params_email)
      end
      format.html { redirect_to :root }
    end
  end

  private

  def params_email
    params.require(:mail).permit(:email, :name, :message)
  end
end