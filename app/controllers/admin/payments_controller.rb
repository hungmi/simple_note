class Admin::PaymentsController < AdminController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  before_action :set_search
  skip_after_action :verify_authorized, only: :summary

  # GET /payments
  def index
    authorize [:admin, :payment], :index?
    dates = Payment.order(Arel.sql("created_at DESC")).pluck(Arel.sql("date(created_at)")).uniq
    @pagy, @payments = pagy(@q.result(distinct: true).order(id: :desc), items: 20)
  end

  # GET /payments/1
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new
    notebook_usage_counts = Payment.select(Arel.sql("count(notebook_id) as count, notebook_id")).group(:notebook_id)
    mostly_used_notebook_count = notebook_usage_counts.map(&:count).max
    mostly_used_notebook_attrs = notebook_usage_counts.select { |c| c.count == mostly_used_notebook_count }
    @default_notebook_id = mostly_used_notebook_attrs.first.notebook_id if mostly_used_notebook_attrs.present?
    authorize [:admin, @payment]
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  def create
    @payment = Payment.new(payment_params)
    authorize [:admin, @payment]

    if @payment.save
      flash[:success] = I18n.t('flash.create_success')
      redirect_to admin_payments_path(anchor: "payment-#{@payment.id}")
    else
      render :new
    end
  end

  # PATCH/PUT /payments/1
  def update
    if @payment.update(payment_params)
      flash[:success] = I18n.t('flash.update_success')
      redirect_to admin_payments_path(anchor: "payment-#{@payment.id}")
    else
      render :edit
    end
  end

  # DELETE /payments/1
  def destroy
    @payment.destroy
    flash[:success] = I18n.t('flash.destroy_success')
    redirect_back fallback_location: admin_payments_path
  end

  def summary ; end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    	authorize [:admin, @payment]
    end

    def set_search
      @q = Payment.ransack(params[:q])
      @nav_search_symbol = :total_eq
      @nav_search_placeholder = nil
    end

    # Only allow a trusted parameter "white list" through.
    def payment_params
      params.require(:payment).permit(:total, :note, :notebook_id, :user_id, :recorder_id, :project_id, :periodic_payment_id, :kind)
    end
end