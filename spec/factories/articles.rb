FactoryGirl.define do
  factory :article do
    volume
    sequence(:title) { |n| "Some Title #{n}" }
  end
end
