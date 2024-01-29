class EventA < Event

  # Note: When an event should be pushed to Iterable? It is being pushed just after creation for now.
	after_commit :publish_event_to_iterable_for_track, on: :create

	def get_campaign_id
		# Campaign Id of the "EventA" (if any, otherwise nil). It should be fetched from the ENV / config file.
		ENV["event_a_campaign_id"] || 0
	end

	def get_template_id
		# Template Id of the "EventA"(if any, otherwise nil). It should be fetched from the ENV / config file
		ENV["event_a_template_id"] || 0
	end

	def iterable_event_track_params
		{
			campaignId: self.get_campaign_id,
			dataFields: {
				eventCreatedAt: self.created_at.to_s,
				userName: self.user.full_name,
				eventName: self.event_name
			}
		}
	end

  # Note: This method should be called asynchronously with "Re-Try" option to handle failure scenario, Ex. Using DelayedJob, etc.
	def publish_event_to_iterable_for_track
		iterable_event = Services::Iterable::Event.new(event: self)
		iterable_event.track
	end

end