module Services
  module Iterable
    class Event
      def initialize(event:)
      	@event = event
      end

      # To publish an event to track
      def track
        begin
        	iterable_event = self.get_iterable_event
        	attrs = @event.iterable_event_track_params
        	response = iterable_event.track @event.event_name, @event.user.email, attrs

        	if response.success?
        		# Mark this event to be 'published'
        		@event.update(is_published: true, published_at: Time.now.to_s) 
        	  Rails.logger.info("\n\n Event #{@event.event_name} through #{self.class.to_s} published successfully, API Response: #{response.body} \n\n")
        	  return true
        	else
        	  error_msg = "Event #{@event.event_name} through #{self.class.to_s} publish failed, API Response: #{response.body}"
        	  Rails.logger.error("\n\n#{error_msg}\n\n")
            # raise error_msg
            return false
        	end
        rescue StandardError => e
          error_msg = "Event #{@event.event_name} through #{self.class.to_s} publish failed. \n#{e.message}\n" + e.backtrace.join("\n")
          Rails.logger.error("\n\n #{error_msg} \n\n")
          # raise error_msg
          return false
        end
      end

      private

      def get_iterable_event
      	@iterable_event ||= ::Iterable::Events.new
      end

    end
  end
end