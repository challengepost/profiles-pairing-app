require 'net/http'

class ProfileSyncJob < ApplicationJob
  queue_as :default

  rescue_from ActiveJob::DeserializationError do |exception|
    # handle a deleted user record
  end

  def perform(options)
    profile = options[:profile]

    Rails.logger.info profile.inspect
    # in production this goes to a URL for a SaaS service
    service_endpoint = Net::HTTP.new('www.google.com', 80)

    service_endpoint.post("/user", { id: profile.id, name: profile.name, age: profile.age }.to_json)
  end
end
