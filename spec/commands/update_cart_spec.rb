module Purchaser
  describe UpdateCart do
    let(:order) { create :order, :with_items}
    subject {UpdateCart.new(params, order)}

    context 'update cart' do

    end
  end
end