module TrackablesHelper

  def tracking_timeline_moment_label(update_type, location_name)
    moment_title = ""
    if update_type == "is_arrival"
      moment_title += "Arrived at "
    elsif update_type == "is_departure"
      moment_title += "Departed "
    end
    moment_title += location_name
    return moment_title
  end

  def tracking_timeline_moment_time(update_time)
    if (update_time < Time.now - 59.minutes)
      update_time.in_time_zone("Pacific Time (US & Canada)").strftime('%m/%d/%y %l:%M %p')
    else
      time_ago_in_words(update_time) + " ago"
    end
  end

  def latest_update(trackable_updates)
    html = ""
    if trackable_updates.length > 0
        html += "Last update: "
        if trackable_updates.first.update_type == "is_arrival"
            html += "Arrived at "
        elsif trackable_updates.first.update_type == "is_departure"
            html += "Departed "
        end
        html += trackable_updates.first.location_name
    else
      html += "No updates yet."
    end
    return html
  end
end
