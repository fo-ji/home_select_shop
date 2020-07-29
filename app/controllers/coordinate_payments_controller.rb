class CoordinatePaymentsController < ApplicationController
  def create
    @coordinate = Coordinate.find(params[:coordinate_id])
    @coordinate_payment = @coordinate.coordinate_payments.build(coordinate_payment_params)

    @coordinate.with_lock do
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      amount = @coordinate.total_price * @coordinate_payment.purchase_amount
      charge = Payjp::Charge.create(currency: "jpy", amount: amount, card: params["payjp-token"])
      @coordinate_payment.charge_id = charge['id']

      respond_to do |format|
        if @coordinate_payment.save
          @coordinate.update(stock: @coordinate.set - @coordinate_payment.purchase_amount)
          format.html { redirect_to coordinate_path(@coordinate), notice: "購入完了しました。" }
        else
          format.html { redirect_to coordinate_path(@coordinate), alert: "数量を確認してください。" }
      end
    end
  end

  rescue Payjp::CardError
    respond_to do |format|
      format.html { redirect_to coordinate_path(@coordinate), notice: "カードエラーが発生しました" }
    end
  end

  private

  def coordinate_payment_params
    params.permit(:purchase_amount, :coordinate_id, :user_id)
  end

  def coordinate_update_params
    params.require(:coordinate).permit(:set)
  end
end
