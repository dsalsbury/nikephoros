FactoryGirl.define do
  factory :article do
    sequence(:title) { |n| "Some Title #{n}" }
  end
end
