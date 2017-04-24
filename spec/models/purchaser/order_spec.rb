require 'rails_helper'

module Purchaser
  RSpec.describe Order, type: :model do
    describe 'Associations' do
    it { should belong_to(:person) }
    it { should belong_to(:delivery) }

    it { should have_one(:credit_card).dependent(:destroy) }
    it { should have_one(:coupon).dependent(:nullify) }
    it { should have_many(:line_items).dependent(:destroy) }
  end
    describe 'Order' do 
      subject { create :order }

      it '#generate_number' do
        expect(subject.generate_number).to eq("#R00#{subject.id.to_s}")
      end

    # it 'calc #subtotal_cart_price' do
    #   allow_any_instance_of(LineItem).to receive(:total_price).and_return(0.01)
    #   expect(subject.subtotal_cart_price).to eq(0.05)
    # end

  #   context 'when calc #coupon_cost ' do
  #     it 'and coupon present' do
  #       order = create(:order, :with_items, :with_coupon)
  #       allow(order).to receive(:subtotal_cart_price).and_return(100.00)
  #       expect(order.coupon_cost).to eq(10.00)
  #     end

  #     it 'and coupon doesn\'t present' do
  #       expect(subject.coupon_cost).to eq(0.00)
  #     end 
  #   end

  #   context 'when calc #delivery_cost ' do 
  #     it 'and delivery present' do
  #       order = create(:order, :with_items, :with_delivery)
  #       expect(order.delivry_cost).to eq(20.00)
  #     end

  #     it 'and delivery doesn\'t present' do
  #       expect(subject.delivry_cost).to eq(0.00)
  #     end 
  #   end 

      context 'aasm state' do
        it 'creating able to checkout' do
          expect(subject).to transition_from(:creating).to(:steps)
            .on_event(:checkout)
        end
        it 'unchecked able to rejecte' do
          expect(subject).to transition_from(:steps).to(:confirm)
            .on_event(:filling_payment)
        end
        it 'creating able to checkout' do
          expect(subject).to transition_from(:confirm).to(:complete)
            .on_event(:place_order)
        end
        it 'unchecked able to rejecte' do
          expect(subject).to transition_from(:complete).to(:in_transit)
            .on_event(:bank_approval)
        end
        it 'unchecked able to rejecte' do
          expect(subject).to transition_from(:in_transit).to(:delivered)
            .on_event(:sent)
        end

        it 'creating able to checkout' do
          expect(subject).to transition_from(:creating).to(:canceled)
            .on_event(:canceling)
        end
        it 'creating able to checkout' do
          expect(subject).to transition_from(:steps).to(:canceled)
            .on_event(:canceling)
        end
        it 'creating able to checkout' do
          expect(subject).to transition_from(:confirm).to(:canceled)
            .on_event(:canceling)
        end
        it 'creating able to checkout' do
          expect(subject).to transition_from(:complete).to(:canceled)
            .on_event(:canceling)
        end
        it 'creating able to checkout' do
          expect(subject).to transition_from(:in_transit).to(:canceled)
            .on_event(:canceling)
        end
      end
    end
  end
end
