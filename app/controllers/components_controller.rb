class ComponentsController < ApplicationController
  before_filter :find_component, :only => [:edit, :update, :show, :destroy]
  before_filter :find_all_components, :only => [:index]
  before_filter :collect_component_types, :only => [:new, :edit]

  respond_to :html, :xml, :json

  # GET /components/new
  def new
    respond_with(@component = Component.new(params[:component]))
  end

  # POST /components
  def create
    respond_with(@component = Component.create(params[:component]), :location => components_url)
  end

  # GET /components/1/edit
  def edit
    respond_with(@component)
  end

  # PUT /components/1
  def update
    respond_with(@component.update_attributes(params[:component]), :location => components_url)
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

  def collect_component_types
    @component_types = Component.component_types.collect do |component_type|
      [component_type.capitalize, component_type]
    end
  end
end
