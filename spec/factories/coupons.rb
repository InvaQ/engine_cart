FactoryGirl.define do
  #sequence :coupon_code { |n| "123#{n}" }
  
  factory :coupon, class: 'Purchaser::Coupon' do
    code '123'
    discount { 10 }
  end
end
