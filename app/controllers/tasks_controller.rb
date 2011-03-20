class TasksController < ApplicationController
  before_filter :find_task, :only => [:edit, :update, :show, :destroy]
  before_filter :find_all_tasks, :only => [:new, :edit, :index]
  before_filter :build_new_task, :only => [:new, :create]

  respond_to :html, :xml, :json

  # GET /tasks/new
  def new
    respond_with(@task)
  end

  # POST /tasks
  def create
    if @task.save
      respond_with(@task, :location => tasks_url)
    else
      render :action => "new"
    end
  end

  # GET /tasks/1/edit
  def edit
    respond_with(@task)
  end

  # PUT /tasks/1
  def update
    if @task.update_attributes(params[:task])
      respond_with(@task, :location => tasks_url)
    else
      render :action => "edit"
    end
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

  def build_new_task
    @task = Task.new(params[:task])
  end
end
