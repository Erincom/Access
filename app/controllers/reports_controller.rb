class ReportsController < ApplicationController

  def attendance_report
    if params[:company].present? && params[:session].present?
      @company = params[:company]
      @session = Session.find(params[:session])

      company_students = Student.by_company(@company)
      @lesson_ids = @session.lessons.pluck(:classid)
      student_array = StudentLesson.where(lesson: @lesson_ids, student: company_students).group_by(&:student).keys
      students = student_array.select(&:studentid)
      @students = students.sort_by(&:lastname)

      if params[:commit] == "Excel"
        render xlsx: "attendance_report", template: "reports/attendance_report.xlsx.axlsx"
      else
        respond_to do |format|
          format.html
        end
      end
      # @lessons_per_student = Lesson.where(session: @session).group(:student_id).group_by(&:student)
    end
  end

  def progress_report
  end

  def score_report
    if params[:student].present?
      @student = Student.find(params[:student])
    end
    if params[:commit] == "PDF"
      # respond_to do |format|
      #   format.pdf do
          render pdf: "score_report"   # Excluding ".pdf" extension.
      #   end
      # end
    else
      respond_to do |format|
        format.html
      end
    end
  end

  def signin_sheet
    if params[:metaclass].present? && params[:month].present?
      @metaclass = Metaclass.find(params[:metaclass])
      @metaclass.lessons.where(classdate: params[:month])
    end
  end

end
