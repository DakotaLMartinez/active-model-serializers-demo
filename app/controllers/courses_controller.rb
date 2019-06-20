class CoursesController < ApplicationController
  def index 
    @courses = Course.all
    respond_to do |f|
      f.html { render :index }
      f.json { render json: @courses, each_serializer: CourseIndexSerializer }
    end
    
  end

  def show 
    @course = Course.find_by(id: params[:id])
    redirect_to courses_path unless @course
    respond_to do |f|
      f.html { render :show }
      f.json { render json: @course }
    end
  end
end
