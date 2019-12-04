require 'rails_helper'

RSpec.describe User, type: :model do
    
    before(:each) do 
        @user = FactoryBot.create(:user)
    end

    it "Has a valid factory" do 
        # test les creations
         expect(build(:user)).to be_valid
    end

    context "validation" do
        
        it "is valid with attributes" do

            expect(@user).to be_a(User)
        end

        # describe "#first_name" do
        #     it { expect(@user).to validate_presence_of(:first_name) }
        #   end
      
        #   describe "#last_name" do
        #     it { expect(@user).to validate_presence_of(:last_name) }
        #   end
      
        #   describe "#username" do
        #     it { expect(@user).to validate_length_of(:username).is_at_least(3) }
        #   end
      

    end

    context "associations" do

    end
    
    context "public instance methods" do
    
    
    end

end