FactoryBot.define do
  
factory :startup do
    name {"startup"}
    catch_phrase {"catch_phrase"}
    website_url {"website_url"}
    description {"description"}
    after(:build) do |startup|
      # startup = create(:startup)
      startup.events << build(:event, startup: startup)
      # startup.events << FactoryGirl.build(:photo, user: user)
      # create(:startup, event: event)
      # event << build(:event, startup: startup)
      # user.sites << build(:site, :processing)
    end
    end
end