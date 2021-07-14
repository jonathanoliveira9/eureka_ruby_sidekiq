class HandlingErrorJob < ApplicationJob
  queue_as :default
  sidekiq_options retry: 5

  def perform(params)
    raise "Something is wrong #{params}"
  end
end
