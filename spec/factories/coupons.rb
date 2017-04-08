FactoryGirl.define do
  sequence :coupon_code { |n| "123#{n}" }
  
  factory :coupon, class: 'Purchaser::Coupon' do
    code { generate :coupon_code }
    discount { 10 }
  end
end
