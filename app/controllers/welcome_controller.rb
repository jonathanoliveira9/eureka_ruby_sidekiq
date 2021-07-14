class WelcomeController < ApplicationController

  def index; end

  def dispatch_mail
    respond_to do |format|
      (params['mail']['quantity'].to_i || 1).times do |t|
        VisitorJob.perform_later(params_email)
      end
      format.html {  }
    end
  end

  def new_handling_error
    respond_to do |format|
      format.js
    end
  end

  def handling_error_mail
    respond_to do |format|
      format.js
      HandlingErrorJob.perform_later("error")
    end
  end

  private

  def params_email
    params.require(:mail).permit(:email, :name, :message, :quantity)
  end
end