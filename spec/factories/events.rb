FactoryBot.define do
  
factory :event do
    title {"event"}
    duration {30}
    description {"event descrription"}
    short_location {"short location"}
    adress {"adress"}
    zip_code {"75000"}
    city{"paris"}
    start_datetime{"2020-01-01 01:00:00"}
    startup

  
    end

    # factory :startup do
    #     name {"startup"}
    #     catch_phrase {"catch_phrase"}
    #     website_url {"website_url"}
    #     description {"description"}
    #     # after(:build) do |startup|
    #     #   startup.events << build(:event, startup: startup)
    #     #   # FactoryBot.build(:event, startup: startup)
    #     # end
    #   end

    # factory :startup_with_events do
    #     transient do
    #       events_count { 1 }
    #     end
    # after(:create) do |startup, evaluator|
    #     create_list(:event, evaluator.events_count, stratup: [stratup])
    #   end
    # end
    
end