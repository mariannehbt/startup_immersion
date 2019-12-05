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
end