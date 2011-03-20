class TasksController < ApplicationController
  before_filter :find_task, :only => [:edit, :update, :show, :destroy]
  before_filter :find_all_tasks, :only => [:new, :edit, :index]
  before_filter :collect_task_types, :only => [:new, :edit]
  before_filter :collect_subtasks, :only => [:edit]

  respond_to :html, :xml, :json

  # GET /tasks/new
  def new
    respond_with(@task = Task.new(params[:task]))
  end

  # POST /tasks
  def create
    respond_with(@task = Task.create(params[:task]), :location => tasks_url)
  end

  # GET /tasks/1/edit
  def edit
    respond_with(@task)
  end

  # PUT /tasks/1
  def update
    respond_with(@task.update_attributes(params[:task]), :location => tasks_url)
  end

  # GET /tasks/1
  def show
    respond_with(@task)
  end

  # GET /tasks
  def index
    respond_with(@tasks)
  end

  # DELETE /tasks/1
  def destroy
    respond_with(@task.destroy, :location => tasks_url)
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def find_all_tasks
    @tasks = Task.all
  end

  def collect_task_types
    @task_types = Task.task_types.collect do |task_type|
      [task_type.capitalize, task_type]
    end
  end

  def collect_subtasks
    @subtasks = @task.subtasks.collect do |subtask|
      subtask.task
    end
  end
end
