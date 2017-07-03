class ReportsController < ApplicationController

  def attendance_report
    if params[:company].present? && params[:session].present?
      @company = params[:company]
      @session = Session.find(params[:session])
      company_students = Student.by_company(@company)
      lesson_ids = @session.lessons.pluck(:classid)
      student_array = StudentLesson.where(lesson: lesson_ids, student: company_students).group_by(&:student).keys
      students = student_array.select(&:studentid)
      @students = students.sort_by(&:lastname)
      # @lessons_per_student = Lesson.where(session: @session).group(:student_id).group_by(&:student)
    end
  end

  def progress_report
  end

  def score_report
  end

end
