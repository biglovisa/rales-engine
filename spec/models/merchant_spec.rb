require "rails_helper"

describe Merchant do
  context "an exisiting merchant" do

    let!(:merchant) { Fabricate(:merchant) }
    let!(:invoice) { Fabricate(:invoice,
                               merchant_id: merchant.id) }
    let!(:invoice_item) { Fabricate(:invoice_item,
                                    invoice_id: invoice.id) }
    let!(:transaction) { Fabricate(:transaction,
                                   invoice_id: invoice.id) }

    context "#revenue" do
      it "returns the total revenue for a merchant across all transactions" do
        expect(merchant.revenue).to eq 0.2
      end
    end
  end
end

# GET /api/v1/merchants/:id/revenue returns the total revenue for that merchant across all transactions
