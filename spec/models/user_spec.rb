require 'rails_helper'

RSpec.describe User, type: :model do
    # let(:group) { FactoryGirl.create :group }
    before(:each) do 

        @user = FactoryBot.build(:user)
        @event = FactoryBot.build(:event)

    end

    it "Has a valid factory" do 
        # test les creations
        expect(build(:user)).to be_valid
        expect(build(:event)).to be_valid
    end

    context "validation" do
        
        it "is valid with attributes" do

            expect(@user).to be_a(User)
            expect(@event).to be_a(Event)
            # expect(@user).to be_a(User)

        end

        # context "presence" do
        #     it { should validate_presence_of(:first_name) }
        #     it { should validate_presence_of(:last_name) }
        #     it { should validate_presence_of(:email) }
        #     it { should validate_presence_of(:encrypted_password) }
        #   end

        # context "uniqueness" do
        #     it { should validate_uniqueness_of(:email )}
        #     it { should validate_uniqueness_of(:username) }
        # end

        describe "#email" do
            it { expect(@user).to validate_presence_of(:email) }
        end
        describe "#password" do
            it { expect(@user).to validate_presence_of(:password).is_at_least(6) }
        end 
        
  
    end

    context "associations" do


        describe "belongs to situation" do
          it { should belong_to(:situation).optional } 
        end

        describe "belongs to activity" do
          it { should belong_to(:activity).optional } 
        end

        describe "belongs to newsletter" do
          it { should belong_to(:newsletter).optional  }
        
        end
             
        describe "Has_many attendances" do
            # expect(@user).to have_many(:attendances)
            it { should have_many(:attendances) }
        end

        describe "Has_many event through attendances" do
            # expect(FactoryBot.create(:user)).to have_many(:events).through(:attendances)
            it { should have_many(:events).through(:attendances) }
        end
      
  
    end
    
    context "public instance methods" do
    
    end

end