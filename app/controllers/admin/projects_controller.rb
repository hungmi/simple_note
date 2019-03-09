class Admin::ProjectsController < AdminController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :set_search

  # GET /projects
  def index
    authorize [:admin, :project], :index?
    @pagy, @projects = pagy(@q.result(distinct: true).order(updated_at: :desc), items: 20)
  end

  # GET /projects/1
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
    authorize [:admin, @project]
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    @project = Project.new(project_params)
    authorize [:admin, @project]

    if @project.save
      flash[:success] = I18n.t('flash.create_success')
      redirect_to [:admin, @project]
    else
      render :new
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      flash[:success] = I18n.t('flash.update_success')
      redirect_to [:admin, @project]
    else
      render :edit
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    flash[:success] = I18n.t('flash.destroy_success')
    redirect_to admin_projects_url
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    	authorize [:admin, @project]
    end

    def set_search
      @q = Project.ransack(params[:q])
      @nav_search_symbol = :id_eq
      @nav_search_placeholder = nil
    end

    # Only allow a trusted parameter "white list" through.
    def project_params
      params.require(:project).permit(:name, :note)
    end
end