class ComponentsController < ApplicationController
  before_filter :find_component, :only => [:edit, :update, :show, :destroy]
  before_filter :find_all_components, :only => [:index]
  before_filter :build_new_component, :only => [:new, :create]

  respond_to :html, :xml, :json

  # GET /components/new
  def new
    respond_with(@component)
  end

  # POST /components
  def create
    if @component.save
      respond_with(@component, :location => components_url)
    else
      render :action => "new"
    end
  end

  # GET /components/1/edit
  def edit
    respond_with(@component)
  end

  # PUT /components/1
  def update
    if @component.update_attributes(params[:component])
      respond_with(@component, :location => components_url)
    else
      render :action => "edit"
    end
  end

  # GET /components/1
  def show
    respond_with(@component)
  end

  # GET /components
  def index
    respond_with(@components)
  end

  # DELETE /components/1
  def destroy
    respond_with(@component.destroy, :location => components_url)
  end

  private

  def find_component
    @component = Component.find(params[:id])
  end

  def find_all_components
    @components = Component.all
  end

  def build_new_component
    @component = Component.new(params[:component])   
  end
end
