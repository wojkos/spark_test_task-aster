FactoryBot.define do
  factory :imported_file do
    filename { 'filename' }
    content_type { 'text/csv' }
    data { 'some data' }
    spree_user_id { nil }
  end
end