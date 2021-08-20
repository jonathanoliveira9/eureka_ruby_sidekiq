class VisitorJob < ApplicationJob
  queue_as :mailers

  def perform(params)
    VisitorMailer.contact_mail(params["name"], params["email"], params["message"]).deliver_now
  end
end
