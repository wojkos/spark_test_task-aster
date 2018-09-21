require 'rails_helper'

feature 'User create products from upload file' do
  before :each do
    @file = fixture_file_upload(Rails.root+'sample.csv', 'text/csv')
  end

end