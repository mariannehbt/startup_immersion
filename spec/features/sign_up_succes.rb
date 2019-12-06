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
      fill_in 'Password confirmation', with: "password"
    end

    # clik clik
    click_button 'Sign up'

    # la page affichée devrait afficher des bonnes nouvelles
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end