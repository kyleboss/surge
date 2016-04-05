module PusherModule
  def self.pusher_pub(hospital_id, trackable_id, location_name, arrival_or_departure)
    text = "Just "
    if arrival_or_departure == :arrival
      text += "arrived at "
    elsif arrival_or_departure == :departure
      text += "departed "
    end
    text += location_name
    begin
      Pusher.trigger("#{hospital_id}-#{trackable_id}", 'tracking_update', {text: text})
    rescue Pusher::Error => e
      puts e
    end
  end
end