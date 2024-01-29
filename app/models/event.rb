class Event < ApplicationRecord
  store :metadata, accessors: [:campaign_id, :template_id, :published_at]

  attr_accessor :event_type

	belongs_to :user
	validates :user_id, :event_name, presence: true

	before_validation :set_defaults, on: :create

	def get_campaign_id
		raise NotImplementedError, "class #{self.class.name} should implement '#{__method__}' method"
	end

	def get_template_id
		raise NotImplementedError, "class #{self.class.name} should implement '#{__method__}' method"
	end

	def self.get_event_class(event_type:)
		case event_type
		when "EventA"
			EventA.new()
		when "EventB"
			EventB.new()
		else
      raise "Unknow event_type #{event_type} to find event class"
		end
	end

	private

	def set_defaults
	  self.is_published = false if self.is_published.nil?
	  self.event_name = self.class.name.to_s if self.event_name.nil?
	  self.campaign_id = self.get_campaign_id
	  self.template_id = self.get_template_id
	end

end
