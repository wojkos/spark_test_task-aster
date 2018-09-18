class ImportedFile < ApplicationRecord
  validates :content_type, presence: true
  validates :filename, presence: true
  validates :data, presence: true
  validate :correct_content_type
  
  def upload_file
    self.filename = (self.data.original_filename)
    self.content_type = self.data.content_type
    self.data = self.data.read
  end

  def correct_content_type 
    acceptable_types = ["text/csv"]
    unless acceptable_types.include? self.content_type
      errors.add(:content_type, "File format have to be csv")
    end
  end
end
