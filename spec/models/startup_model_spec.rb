require 'rails_helper'
RSpec.describe Startup, type: :model do
    # let(:group) { FactoryGirl.create :group }
    before(:each) do 
        @event = FactoryBot.build(:event, startup: @startup)
        @startup = FactoryBot.build(:startup)

    end

    it "Has a valid factory" do 
        # test les creations
        expect(build(:event)).to be_valid
        expect(build(:startup)).to be_valid
    end

    context "validation" do

        describe "#title" do
             it { expect(@startup).to validate_presence_of(:name)  }
        end
        describe "#title" do
              it { expect(@startup).to validate_presence_of(:catch_phrase)  }
        end
        describe "#title" do
             it { expect(@startup).to validate_presence_of(:website_url)  }
        end
        describe "#title" do
             it { expect(@startup).to validate_presence_of(:description)  }
        end

        it "is valid with attributes" do

            expect(@startup).to be_a(Startup)
            expect(@event).to be_a(Event)
        end
        it "should return a string" do
            expect(@startup.name).to be_a(String)
            expect(@startup.catch_phrase).to be_a(String)
            expect(@startup.website_url).to be_a(String)
            expect(@startup.description).to be_a(String)
          end

          it "should return the Good Value" do
            expect(@startup.name).to eq("startup")
            expect(@startup.catch_phrase).to eq("catch_phrase")
            expect(@startup.website_url).to eq("website_url")
            expect(@startup.description).to eq("description")
          end
          it "should not equal the Value" do
            expect(@startup.name).not_to eq("upstart")
            expect(@startup.catch_phrase).not_to eq("phrase catch_")
            expect(@startup.website_url).not_to eq("url website")
            expect(@startup.description).not_to eq("no description")
          end
    end

    context "associations" do
        describe "Has_many attendances" do
            it { expect(@startup).to have_many(:events) }
        end
    end
    
  
    context "public instance methods" do

    
      end

end