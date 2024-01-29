module Services
  module Iterable
    class Email
      def initialize(event:)
      	@event = event
      end

      # To publish an event to send an email
      def target
        begin
          iterable_email = self.get_iterable_email
          attrs = @event.iterable_email_target_params
          response = iterable_email.target @event.user.email, @event.campaign_id, attrs

          if response.success?
            # Mark this event to be 'published'
            @event.update(is_published: true, published_at: Time.now.to_s) 
            Rails.logger.info("\n\nEvent #{@event.event_name} through #{self.class.to_s} published successfully, API Response: #{response.body} \n\n")
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

      def get_iterable_email
      	@iterable_email ||= ::Iterable::Email.new
      end

    end
  end
end