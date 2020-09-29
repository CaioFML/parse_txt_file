class ImportersController < ApplicationController
  def create
    return redirect_to sales_path, notice: "Arquivo não informado" unless params[:file].present?

    ImportFile.call(params[:file].read.force_encoding("UTF-8"))

    redirect_to sales_path, notice: "Arquivo importado com sucesso"
  end
end
