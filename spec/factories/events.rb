FactoryBot.define do
  
factory :event do
    title {"event"}
    duration {30}
    description {"event descrription"}
    short_location {"short location"}
    adress {"adress"}
    startup
    # startup { [association(:startup)] }
    # startup
    # after(:build) do |user|
    #     event = create(:event)
    #     user.attendances << build(:attendance, user: user, event: event)
    #     # create_list(:events, evaluator.events_count, user: user)
    #   end
    #   after(:build) do |event|
    #     # startup = create(:startup)
    #     event.photos << FactoryGirl.build(:photo, user: user)
    #     create(:startup, event: event)
    #     # event << build(:event, startup: startup)
    #     # user.sites << build(:site, :processing)
    #   end
    end
end