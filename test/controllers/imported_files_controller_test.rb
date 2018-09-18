require 'test_helper'

class ImportedFilesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get imported_files_new_url
    assert_response :success
  end

  test "should get create" do
    get imported_files_create_url
    assert_response :success
  end

  test "should get index" do
    get imported_files_index_url
    assert_response :success
  end

end
