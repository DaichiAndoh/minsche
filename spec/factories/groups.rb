FactoryBot.define do
  factory :group do
    name "sample"
    introduction "This is a group!"
    code 123
    password "sample"
    
    #コールバック勉強用
    trait :with_schedules do
      after(:create) { |group| create_list(:schedule, 5, group: group) }
    end
    
    # 無効になる
    trait :invalid do
      name nil
    end

    
  end
end
