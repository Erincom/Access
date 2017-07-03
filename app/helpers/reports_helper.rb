module ReportsHelper
  include MetaclassesHelper

  def calculate_hours_attended(student, metaclass_array)
    attended_classes = 0
    metaclass_array.each do |metaclass|
      metaclass.lessons.each do |lesson|
        attended_classes += 1 if lesson.student_lessons.where(student: student).first.attendance == true
      end
    end
    attended_classes
  end

  def calculate_total_hours(metaclass_array)
    total_hours = 0
    metaclass_array.each do |metaclass|
      number_classes = metaclass.lessons.size
      number_hours = calculate_hours(metaclass.metaclassdaytime)
      total_metaclass_hours = number_classes * number_hours
      total_hours += total_metaclass_hours
    end
    total_hours
  end
end
