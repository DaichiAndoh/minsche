FactoryBot.define do
  factory :schedule do
    title "Practice"
    start_time "2020-05-27 12:00:00"
    end_time "2020-05-27 18:00:00"
    association :group
  end
end
