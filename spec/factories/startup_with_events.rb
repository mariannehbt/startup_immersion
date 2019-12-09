
FactoryBot.define do
factory :startup_with_events do
        transient do
          events_count { 1 }
        end
    after(:create) do |startup, evaluator|
        create_list(:event, evaluator.events_count, stratup: stratup)
      end
    end
end