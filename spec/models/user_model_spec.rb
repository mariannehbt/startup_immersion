require 'rails_helper'

RSpec.describe User, type: :model do
    before(:each) do 
        @user = FactoryBot.build(:user)
    end

    it "Has a valid factory" do 
        # test les creations
        expect(build(:user)).to be_valid
    end

    context "validation" do
        
        it "is valid with attributes" do

            expect(@user).to be_a(User)
        end

        it "should return a string" do
            expect(@user.email).to be_a(String)
            expect(@user.password).to be_a(String)
            expect(@user.password_confirmation).to be_a(String)
            expect(@user.first_name).to be_a(String)
            expect(@user.last_name).to be_a(String)
            expect(@user.formation).to be_a(String)
            expect(@user.description).to be_a(String)
            expect(@user.linked_in_url).to be_a(String)
        end
        it "should return the Valid" do
            expect(@user.email).to eq("email01@example.com")
            expect(@user.password).to eq("password")
            expect(@user.password_confirmation).to eq("password")
            expect(@user.first_name).to eq("qwerty")
            expect(@user.last_name).to eq("us")
            expect(@user.formation).to eq("master")
            expect(@user.description).to eq("etudiant")
            expect(@user.linked_in_url).to eq("linked_in_url")
        end
        it "should return the Not valid" do
            expect(@user.email).not_to eq("wrong_email@example.com")
            expect(@user.password).not_to eq("wrong_email_password")
            expect(@user.password_confirmation).not_to eq("wrong_email_password")
            expect(@user.first_name).not_to eq("azerty")
            expect(@user.last_name).not_to eq("fr")
            expect(@user.formation).not_to eq("bac")
            expect(@user.description).not_to eq("professeur")
            expect(@user.linked_in_url).not_to eq("no linked_in_url")
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
            it { expect(@user).to have_many(:attendances) }
        end

        describe "Has_many event through attendances" do
            it { expect(@user).to have_many(:events).through(:attendances) }
        end
    end
    
    context "public instance methods" do

        
    end

end