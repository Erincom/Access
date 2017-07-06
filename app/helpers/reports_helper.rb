module ReportsHelper
  include MetaclassesHelper

  def calculate_hours_attended(student, student_lesson_array)
    attended_hours = 0
    lesson_ids = student_lesson_array.pluck(:classid)
    lesson_ids.each do |lesson_id|
      lesson = Lesson.find(lesson_id)
      duration = calculate_hours(lesson.metaclass.metaclassdaytime)
        attended_hours += (1 * duration) if lesson.student_lessons.where(student: student).first.attendance == true
    end
    attended_hours
  end

  def calculate_total_hours(student, student_lesson_array)
    total_hours = 0
    lesson_ids = student_lesson_array.pluck(:classid)
    lesson_ids.each do |lesson_id|
      lesson = Lesson.find(lesson_id)
      duration = calculate_hours(lesson.metaclass.metaclassdaytime)
      hours = 1 * duration
      total_hours += hours
    end
    total_hours
  end
end
