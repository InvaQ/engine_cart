FactoryGirl.define do
  factory :line_item, class: 'Purchaser::LineItem' do
    quantity 1
    price 0.01
  end
end