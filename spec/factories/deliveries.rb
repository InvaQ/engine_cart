FactoryGirl.define do

  
  factory :delivery, class: 'Purchaser::Delivery' do
    name 'Post'
    min_days 3
    max_days 9
    price    20.00
  end
end
