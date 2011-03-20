class SubtasksController < ApplicationController
  before_filter :find_subtask, :only => [:update, :destroy]
  before_filter :find_task, :only => [:update, :destroy]

  respond_to :html, :xml, :json

  # POST /tasks/1/subtasks
  def create
    @subtask = Subtask.create(params[:subtask])
    find_task
    respond_with(@task, :location => edit_task_url(@task))
  end

  # PUT /tasks/1/subtasks/1
  def update
    @subtask.update_attributes(params[:subtask])
    respond_with(@task, :location => edit_task_url(@task))
  end

  # DELETE /tasks/1/subtasks/1
  def destroy
    @subtask.destroy
    respond_with(@task, :location => edit_task_url(@task))
  end

  private

  def find_subtask
    @subtask = Subtask.find(params[:id])
  end

  def find_task
    @task = Task.find(@subtask.task_id)
  end
end
