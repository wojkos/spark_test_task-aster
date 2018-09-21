require 'rails_helper'

RSpec.describe ImportedFile, type: :model do
  let!(:imported_file) { FactoryBot.create(:imported_file) }

  it { should validate_presence_of(:content_type) }
  it { should validate_presence_of(:data) }
  it { should validate_presence_of(:filename) }
  # test format
  it { should_not allow_value('pdf').for(:content_type) }
end
