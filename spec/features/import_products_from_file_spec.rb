require 'rails_helper'

feature 'Add products from CSV file' do

  scenario 'upload should create products' do
    expect(Spree::Product.count).to eq 0
    visit 'admin/import'
    attach_file('imported_file_data', Rails.root+'sample.csv')
    click_button 'Import file'
    expect(Spree::Product.count).to eq 3
  end
end
