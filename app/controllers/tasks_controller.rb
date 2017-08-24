class TasksController < ApplicationController
  load_and_authorize_resource :find_by => :slug
  def show
	course = Course.friendly.find(params[:course_id])
	@tasks = course.tasks
	#@task = @tasks.friendly.find(params[:id])
  end
end
