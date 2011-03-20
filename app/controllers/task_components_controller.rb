class TaskComponentsController < ApplicationController
  before_filter :find_task_component, :only => [:update, :destroy]
  before_filter :find_task, :only => [:update, :destroy]

  respond_to :html, :xml, :json

  # POST /tasks/1/task_components
  def create
    @task_component = TaskComponent.create(params[:task_component])
    find_task
    respond_with(@task, :location => edit_task_url(@task))
  end

  # PUT /tasks/1/task_components/1
  def update
    @task_component.update_attributes(params[:task_component])
    respond_with(@task, :location => edit_task_url(@task))
  end

  # DELETE /tasks/1/task_components/1
  def destroy
    @task_component.destroy
    respond_with(@task, :location => edit_task_url(@task))
  end

  private

  def find_task_component
    @task_component = TaskComponent.find(params[:id])
  end

  def find_task
    @task = Task.find(@task_component.task_id)
  end
end
