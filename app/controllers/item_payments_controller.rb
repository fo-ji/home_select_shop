class ItemPaymentsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @item_payment = @item.item_payments.build(item_payment_params)

    @item.with_lock do
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      amount = @item.price * @item_payment.purchase_amount
      charge = Payjp::Charge.create(currency: "jpy", amount: amount, card: params["payjp-token"])
      @item_payment.charge_id = charge['id']

      respond_to do |format|
        if @item_payment.save
          @item.update(stock: @item.stock - @item_payment.purchase_amount)
          format.html { redirect_to item_path(@item), notice: "購入完了しました。" }
        else
          format.html { redirect_to item_path(@item), alert: "数量を確認してください。" }
      end
    end
  end

  rescue Payjp::CardError
    respond_to do |format|
      format.html { redirect_to item_path(@item), notice: "カードエラーが発生しました" }
    end
  end

  private

  def item_payment_params
    params.permit(:purchase_amount, :item_id, :user_id)
  end

  def item_update_params
    params.require(:item).permit(:stock)
  end
end
