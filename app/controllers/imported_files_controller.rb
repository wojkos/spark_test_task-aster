class ImportedFilesController < ApplicationController
  def new
    @imported_file = ImportedFile.new
  end

  def create
    @imported_file = ImportedFile.new(imported_files_params)
    @imported_file.upload_file

    if @imported_file.save
        flash[:notice] = "Thank you for your submission..."
        redirect_to :action => "index"
    else
        flash[:error] = "There was a problem submitting your imported_file."
        render :action => "new"
    end
  end

  def index
    @imported_files = ImportedFile.all
  end
  
  private

  def imported_files_params
    params.require(:imported_file).permit(:filename, :data, :content_type)
  end
end
