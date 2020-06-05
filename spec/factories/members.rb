FactoryBot.define do
  factory :member do
    name "sample"
    sequence(:email) { |n| "sample#{n}@sample.com" }
    # email 'sample@sample.com'
    password "sample"
  end
end
