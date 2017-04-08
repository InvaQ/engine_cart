require 'rails_helper'

module Purchaser
  RSpec.describe UpdateCoupon do
    let(:order) { create :order}
    let(:params) { { code: "123" } }
    #let(:update_coupon) { subject.new(params, order) }

    context 'update coupon' do
      it 'when dont need update' do
        allow(subject).to receive(:new).with(params, order)
        allow_any_instance_of(subject).to receive(:dont_need_update).and_return(false)
          expect(update_coupon.call(params, order)).to eq(false)
      end
    end
  end
end