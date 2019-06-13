class CoursesController < ApplicationController
  def index 
    @courses = Course.all
  end

  def show 
    @course = Course.find_by(id: params[:id])
    redirect_to courses_path unless @course
  end
end
