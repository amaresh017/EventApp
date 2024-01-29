Iterable.configure do |config|
  config.token = ENV["iterable_api_token"] || "NO-API-TOKEN-PROVIDED"
end


# Creating a new config with a different token
# config = Iterable::Config.new(token: 'new-token')

# Example of using it with the campaigns endpoints
# which will then make API requests using the passed in config
# campaigns = Iterable::Campaigns.new(config)