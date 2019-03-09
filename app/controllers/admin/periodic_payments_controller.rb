class Admin::PeriodicPaymentsController < AdminController
  before_action :set_periodic_payment, only: [:show, :edit, :update, :destroy]
  before_action :set_search

  # GET /periodic_payments
  def index
    authorize [:admin, :periodic_payment], :index?
    # @pagy, @periodic_payments = pagy(@q.result(distinct: true).order(updated_at: :desc), items: 20)
    @periodic_payments = @q.result(distinct: true).order(updated_at: :desc)
  end

  # GET /periodic_payments/1
  def show
  end

  # GET /periodic_payments/new
  def new
    @periodic_payment = PeriodicPayment.new
    authorize [:admin, @periodic_payment]
  end

  # GET /periodic_payments/1/edit
  def edit
  end

  # POST /periodic_payments
  def create
    @periodic_payment = PeriodicPayment.new(periodic_payment_params)
    authorize [:admin, @periodic_payment]

    if @periodic_payment.save
      flash[:success] = I18n.t('flash.create_success')
      redirect_to [:admin, @periodic_payment]
    else
      render :new
    end
  end

  # PATCH/PUT /periodic_payments/1
  def update
    if @periodic_payment.update(periodic_payment_params)
      flash[:success] = I18n.t('flash.update_success')
      redirect_to [:admin, @periodic_payment]
    else
      render :edit
    end
  end

  # DELETE /periodic_payments/1
  def destroy
    @periodic_payment.destroy
    flash[:success] = I18n.t('flash.destroy_success')
    redirect_to admin_periodic_payments_url
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_periodic_payment
      @periodic_payment = PeriodicPayment.find(params[:id])
    	authorize [:admin, @periodic_payment]
    end

    def set_search
      @q = PeriodicPayment.ransack(params[:q])
      @nav_search_symbol = :id_eq
      @nav_search_placeholder = nil
    end

    # Only allow a trusted parameter "white list" through.
    def periodic_payment_params
      params.require(:periodic_payment).permit(:total, :scheduled_day, :note)
    end
end