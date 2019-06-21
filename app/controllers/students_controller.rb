class StudentsController < ApplicationController
  def index 
    if params[:course_id]
      @course = Course.find_by(id: params[:course_id])
      @students = @course && @course.students
      if @students
        respond_to do |f|
          f.html {}
          f.json { render json: @students, each_serializer: CourseStudentSerializer }
        end
      else
        @error = "Course not found"
        respond_to do |f|
          f.html {}
          f.json { render json: {message: @error}, status: :not_found }
        end
      end
    else
      @students = Student.all 
      respond_to do |f|
        f.html {}
        f.json { render json: @students }
      end
    end
    
  end 

  def show 
    @student = Student.find_by(id: params[:id])
    respond_to do |f|
      f.html { render :show }
      f.json { render json: @student }
    end
  end
end
