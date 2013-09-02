FactoryGirl.define do
  factory :article do
    sequence(:title) { |n| "Some Title #{n}" }
    date '2013-09-01'
  end
end
