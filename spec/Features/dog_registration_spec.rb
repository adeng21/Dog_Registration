require 'spec_helper'

feature 'dog registration', %Q{
  As a dog owner
  I want to register my dog
  So that I can connect with other dog lovers
} do

  #Acceptance Criteria
  #An owner must specify their first name, last name, email address, and dog's name
  #Upon adding my entry, I can see a list of other registered dog owners.
  #An owner's full_name can be requested

  scenario 'I can register my dog and see a list of all registered dog owners, including their full names' do
    count = Dogregistration.count
    visit new_dogregistration_path
    fill_in 'First name', with: 'Awesome'
    fill_in 'Last name', with: 'Owner'
    fill_in 'Email', with: 'awesome@owner.com'
    fill_in 'Dog name', with: 'Happy'
    click_on 'Register Dog'
    visit dogregistrations_path

    expect(page).to have_content('Awesome', 'Owner')
    expect(Dogregistration.count).to eql(count + 1)
  end


  scenario 'Create an invalid registration' do
    count = Dogregistration.count
    visit new_dogregistration_path
    fill_in 'First name', with: ''
    fill_in 'Last name', with: 'Owner'
    fill_in 'Email', with: 'awesome@owner.com'
    fill_in 'Dog name', with: 'Happy'
    click_on 'Register Dog'

    expect(page).to have_content("can't be blank")
    expect(Dogregistration.count).to eql(count)
  end

  scenario 'I can optionally specify a breed of dog when registering' do

    count = Dogregistration.count
    visit new_dogregistration_path
    fill_in 'First name', with: 'Awesome'
    fill_in 'Last name', with: 'Owner'
    fill_in 'Email', with: 'awesome@owner.com'
    fill_in 'Dog name', with: 'Happy'
    fill_in 'Breed', with: ''
    click_on 'Register Dog'

    expect(Dogregistration.count).to eql(count + 1)
  end

end







