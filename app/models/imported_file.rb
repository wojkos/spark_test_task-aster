class ImportedFile < ApplicationRecord
  validates :content_type, presence: true
  validates :filename, presence: true
  validates :data, presence: true
  validate :correct_content_type

  def upload_file
    self.filename = data.original_filename
    self.content_type = data.content_type
    self.data = data.read
  end

  def correct_content_type
    acceptable_types = ['text/csv']
    unless acceptable_types.include? content_type
      errors.add(:content_type, 'File format have to be csv')
    end
  end
end
