class EventsController < ApplicationController

	def create
		event = Event.get_event_class(event_type: event_params[:event_type])
		event.assign_attributes(user: current_user, event_name: event_params[:event_name])
    if event.save
    	redirect_to current_user, notice: "#{event.type} created successfully"
    else
    	redirect_to current_user, error: "#{event.type} creation failed, Error: #{event.errors.full_messages.join(',')}"
    end
	end

	private
	# Only allow a trusted parameter through "white list".
	def event_params
	  params.require(:event).permit(:event_type, :event_name) rescue []
	end
end
