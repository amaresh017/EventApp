class EventB < Event

  # Note: When an event should be pushed to Iterable? It is being pushed just after creation for now.
	after_commit :publish_event_to_iterable_for_email, on: :create

	def get_campaign_id
		# Campaign Id of the "EventA". It should be fetched from the ENV / config file.
		ENV["event_b_campaign_id"] || 0
	end

	def get_template_id
		# Template Id of the "EventA". It should be fetched from the ENV / config file
		ENV["event_b_template_id"] || 0
	end

	def iterable_email_target_params
		{
			dataFields: {
				fullName: self.user.full_name,
				email: self.user.email
			}
		}
	end

  # Note: This method should be called asynchronously with "Re-Try" option to handle failure scenario, Ex. Using DelayedJob, etc.
	def publish_event_to_iterable_for_email
		iterable_email = Services::Iterable::Email.new(event: self)
		iterable_email.target
	end

end