class LessonsController < ApplicationController
	before_action :authenticate_user!
	before_action :require_enrolled_for_current_course, :only => [:show]

	def show
	end

	private
  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

  def require_enrolled_for_current_course
    if ! current_user.enrolled_in?(current_lesson.section.course)
			redirect_to :back, :alert => "Please enroll to access this lesson."
		end
  end
 
end
