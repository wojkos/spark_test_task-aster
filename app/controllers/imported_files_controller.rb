class ImportedFilesController < ApplicationController
  def new
    @imported_file = ImportedFile.new
  end

  def create
    @imported_file = ImportedFile.new(imported_files_params)
    @imported_file.upload_file

    if @imported_file.save
      redirect_to '/admin'
      ProductsImporterService.new(params[:imported_file][:data]).import
    else
      flash[:error] = 'There was a problem with your imported_file.'
      render action: 'new'
    end
  end

  private

  def imported_files_params
    params.require(:imported_file).permit(:filename, :data, :content_type)
  end
end
