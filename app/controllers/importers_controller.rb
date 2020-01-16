class ImportersController < ApplicationController

  def new

  end

  def create
    begin
      @power_station = PowerStation.find(params[:power_station_id])

      file_params['files'].each do |file_io|
        File.open(Rails.root.join('tmp', 'storage', file_io.original_filename), 'wb') do |file|
          file.write(file_io.read)
        end
        ImportJob.perform_now Rails.root.join('tmp', 'storage', file_io.original_filename), @power_station
      end

      ConsolidateJob.perform_now

      flash[:success] = "Les données ont correctement été importés !"
    rescue
      flash[:error] = "Une erreur est survenue. Veuillez rééssayer."
    end

    redirect_to root_url
  end

  private

  def file_params
    params.require(:importer)
  end

end
