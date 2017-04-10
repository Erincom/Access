module MetaclassesHelper
  def calculate_hours(metaclassdaytime)
    timeslot_array = metaclassdaytime.split(" ")
    times_array = timeslot_array[1].split("-")
    new_times_array = []
    times_array.each do |time|
      if time.include? ":30"
        time = time.to_i
        time += 0.5
      elsif time.include? ":15"
        time = time.to_i
        time += 0.25
      elsif time.include? ":45"
        time = time.to_i
        time -= 0.15
      else
        time = time.to_i
      end

      if time < 8.5
        time += 12.0
      end
      new_times_array << time
    end
    duration = new_times_array[1] - new_times_array[0]
    duration.abs
  end
end
