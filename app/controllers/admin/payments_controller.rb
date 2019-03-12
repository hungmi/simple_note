class Admin::PaymentsController < AdminController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  before_action :set_search

  # GET /payments
  def index
    authorize [:admin, :payment], :index?
    dates = Payment.order(Arel.sql("created_at DESC")).pluck(Arel.sql("date(created_at)")).uniq
    @pagy, @dates = pagy_array(dates, items: 3)
    @payments = Payment.where("date(created_at) <= ? AND date(created_at) >= ?", @dates.max, @dates.min)
  end

  # GET /payments/1
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new
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
    redirect_to admin_payments_url
  end

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
      params.require(:payment).permit(:total, :note, :notebook_id, :user_id, :recorder_id, :project_id, :periodic_payment_id)
    end
end