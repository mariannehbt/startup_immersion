# require 'spec_helper'
require 'rails_helper'
describe "the signup process", type: :feature do
    before :each do
      # @user = FactoryBot.create(:user)
    #   User.make(email: 'user@example.com', password: 'password')
    end
    it "signs me in fail" do
        # on va sur la page de création d'utilisateurs
      #   visit '/users/new'
          visit new_user_session_path
          
        # dans le formulaire des users, on remplit les données qu'il faut
        within("#new_user") do
          fill_in 'Email', with: 'user@xample.com'
          fill_in 'Password', with: 'pasword'
        end
    
        # clik clik
        click_button 'Log in'
    
        # la page affichée devrait afficher des bonnes nouvelles
        expect(page).to have_content "Invalid Email or password."
    end
end