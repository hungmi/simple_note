class Admin::PaymentsController < AdminController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  before_action :set_search

  # GET /payments
  def index
    authorize [:admin, :payment], :index?
    @pagy, @payments = pagy(@q.result(distinct: true).order(updated_at: :desc), items: 20)
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
      redirect_to [:admin, @payment]
    else
      render :new
    end
  end

  # PATCH/PUT /payments/1
  def update
    if @payment.update(payment_params)
      flash[:success] = I18n.t('flash.update_success')
      redirect_to [:admin, @payment]
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
      @nav_search_symbol = :id_eq
      @nav_search_placeholder = nil
    end

    # Only allow a trusted parameter "white list" through.
    def payment_params
      params.require(:payment).permit(:total)
    end
end