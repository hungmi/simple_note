class Admin::NotebooksController < AdminController
  before_action :set_notebook, only: [:show, :edit, :update, :destroy]
  before_action :set_search

  # GET /notebooks
  def index
    authorize [:admin, :notebook], :index?
    @pagy, @notebooks = pagy(@q.result(distinct: true).order(updated_at: :desc), items: 20)
  end

  # GET /notebooks/1
  def show
  end

  # GET /notebooks/new
  def new
    @notebook = Notebook.new
    authorize [:admin, @notebook]
  end

  # GET /notebooks/1/edit
  def edit
  end

  # POST /notebooks
  def create
    @notebook = Notebook.new(notebook_params)
    authorize [:admin, @notebook]

    if @notebook.save
      flash[:success] = I18n.t('flash.create_success')
      redirect_to [:admin, @notebook]
    else
      render :new
    end
  end

  # PATCH/PUT /notebooks/1
  def update
    if @notebook.update(notebook_params)
      flash[:success] = I18n.t('flash.update_success')
      redirect_to [:admin, @notebook]
    else
      render :edit
    end
  end

  # DELETE /notebooks/1
  def destroy
    @notebook.destroy
    flash[:success] = I18n.t('flash.destroy_success')
    redirect_to admin_notebooks_url
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_notebook
      @notebook = Notebook.find(params[:id])
    	authorize [:admin, @notebook]
    end

    def set_search
      @q = Notebook.ransack(params[:q])
      @nav_search_symbol = :id_eq
      @nav_search_placeholder = nil
    end

    # Only allow a trusted parameter "white list" through.
    def notebook_params
      params.require(:notebook).permit(:name, :note)
    end
end