FactoryGirl.define do
  factory :order, class: 'Purchaser::Order' do
    user_id nil

    trait :with_items do
      transient do
        amount_of_items 5
      end
      after(:create) do |order, value|
        create_list :line_item, value.amount_of_items, order: order
      end
    end

    trait :with_addresses do
      after(:create) do |order|
        create(:billing_address, addressable: order)
        create(:shipping_address, addressable: order)
      end
    end

    trait :with_delivery do
      after(:create) do |order|
        order.delivery = create(:delivery)
        order.save
      end
    end

    trait :with_coupon do
      after(:create) do |order|
        order.coupon = create(:purchaser_coupon)
        order.save
      end
    end


    trait :with_credit_card do
      after(:create) do |order|
        order.credit_card = create(:purchaser_credit_card)
        order.save
      end
    end

    trait :complete_order do
      with_items
      with_coupon
      with_addresses
      with_delivery
      with_credit_card
    end
  end
end
