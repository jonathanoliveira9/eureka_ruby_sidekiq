class VisitorJob < ApplicationJob
  queue_as :default

  def perform(params)
    VisitorMailer.contact_mail(params[:name], params[:email], params[:message]).deliver
  end
end
