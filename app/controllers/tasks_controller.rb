class TasksController < ApplicationController
  load_and_authorize_resource :find_by => :slug
  def show
	course = Course.friendly.find(params[:course_id])
	@tasks = course.tasks.accessible_by(current_ability)
  @previous_task = @task.previous_task
  @next_task = @task.next_task
  end
  def complete
    current_user.complete_task(@task)
    course = Course.friendly.find(params[:course_id])
    @tasks = course.tasks.accessible_by(current_ability)
    @next_task = @task.next_task
    if @next_task
      redirect_to course_task_path(@task.course, @next_task), notice: "Task has been complete."
    else
      redirect_to @task.course, notice: "Course completed."
    end
  end
end
