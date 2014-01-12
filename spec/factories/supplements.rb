FactoryGirl.define do
  factory :supplement do
    sequence(:title) { |n| "Some Title #{n}" }
    number 1
    pages 100
    description 'Some description'
  end
end
