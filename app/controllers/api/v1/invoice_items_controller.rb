class Api::V1::InvoiceItemsController < Api::V1::BaseController
  def show
    respond_with InvoiceItem.find(params[:id])
  end

  def find
    value = find_params.values.first
    term = find_params.keys.first

    respond_with InvoiceItem.find_by(term => value)
  end

  def find_all
    value = find_params.values.first
    term = find_params.keys.first

    respond_with InvoiceItem.where(term => value)
  end

  def random
    value = rand(InvoiceItem.count)
    respond_with InvoiceItem.find(value)
  end

  private

  def find_params
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price)
  end

end