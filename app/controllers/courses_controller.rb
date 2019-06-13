class CoursesController < ApplicationController
  def index 
    @courses = Course.all
    respond_to do |f|
      f.html { render :index }
      f.json { render json: @courses }
    end
    
  end

  def show 
    @course = Course.find_by(id: params[:id])
    redirect_to courses_path unless @course
  end
end
