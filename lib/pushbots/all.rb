module Pushbots
  # All class
  class All < Push
    attr_accessor :badge,
                  :device_alias,
                  :except_alias,
                  :payload,
                  :schedule,
                  :sound,
                  :tags

    def initialize(platforms, message, schedule, options = {})
      super(platforms, message, :all)

      self.badge = options[:badge]
      self.device_alias = options[:alias]
      self.except_alias = options[:except_alias]
      self.payload = options[:payload]
      self.schedule = schedule
      self.sound = options[:sound]
      self.tags = options[:tags]
    end

    def send
      self.response = Request.send(:all, body)
      self.status =
        response.failed? ? STATUS[:failed] : STATUS[:delivered]
    end

    def body
      data = {
        platform: @platform,
        msg: message,
        schedule: schedule
      }

      data[:alias] = device_alias if device_alias
      data[:badge] = badge if badge
      data[:except_alias] = except_alias if except_alias
      data[:payload] = payload if payload
      data[:sound] = sound if sound
      data[:tags] = tags if tags
      data
    end
  end
end
