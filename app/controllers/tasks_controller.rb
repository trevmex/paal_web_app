class TasksController < ApplicationController
  before_filter :find_task, :only => [:edit, :update, :show, :destroy]
  before_filter :find_all_tasks, :only => [:new, :edit, :index]
  before_filter :find_all_components, :only => [:edit]
  before_filter :build_new_task, :only => [:new, :create]

  respond_to :html, :xml, :json, :lightbox

  # GET /tasks/new
  def new
    respond_with(@task)
  end

  # POST /tasks
  def create
    if @task.save
      flash[:notice] = I18n.t(:"flash.tasks.update.notice", :task_type => @task.task_type.capitalize)
      respond_with(@task, :location => edit_task_url(@task))
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
      flash[:notice] = I18n.t(:"flash.tasks.update.notice", :task_type => @task.task_type.capitalize)
      respond_with(@task, :location => edit_task_url(@task))
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
    if params[:task_type]
      @task_type = params[:task_type]
      @title_width = "fullTitleWidth"
    else
      @task_type = "task"
      @title_width = "halfTitleWidth"
    end
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
    @tasks = Task.all(params[:task_type])
  end

  def find_all_components
    @components = Component.all
  end

  def build_new_task
    @task = Task.new(params[:task])
  end
end
