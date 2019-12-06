require 'rails_helper'
# require 'spec_helper'
describe "the signup process", type: :feature do
  before :each do
    User.create(email: 'email01@example.com', password: 'password', password_confirmation: "password")
  end

  it "signs me in" do
    # on va sur la page de création d'utilisateurs
    visit  new_user_registration

    # dans le formulaire des users, on remplit les données qu'il faut
    within("#new_user") do
      fill_in 'Email', with: "email01@example.com"
      fill_in 'Password', with: "password"
      fill_in 'Password confirmation', with: "pass"
    end

    # clik clik
    click_button 'Sign up'

    # la page affichée devrait afficher des bonnes nouvelles
    
    expect(page).to have_content "Password confirmation doesn't match Password"
    expect(page).to have_content "Password is too short (minimum is 6 characters)"
    expect(page).to have_content "Password can't be blank"
    expect(page).to have_content "Email can't be blank"
  end
end