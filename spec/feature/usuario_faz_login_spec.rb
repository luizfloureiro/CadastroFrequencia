require 'rails_helper'
include Devise::Test::ControllerHelpers

feature 'User faz login' do
  scenario 'usuário sem login visita home page' do
    visit root_path
    click_on 'Login'
    expect(page).to have_text('Log in')
  end
end