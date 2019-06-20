class StudentsController < ApplicationController
  def index 
    if params[:course_id]
      @course = Course.find_by(id: params[:course_id])
      @students = @course && @course.students
    else
      @students = Student.all 
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
