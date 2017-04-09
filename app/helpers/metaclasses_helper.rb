module MetaclassesHelper
  def calculate_hours(metaclassdaytime)
    timeslot_array = metaclassdaytime.split(" ")
    times_array = timeslot_array[1].split("-")
    duration = times_array[1].to_time - times_array[0].to_time
    duration.abs / 3600
  end
end
