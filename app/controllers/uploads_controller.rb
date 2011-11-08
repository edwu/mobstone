class UploadsController < ApplicationController
    def show
      headers['Cache-Control'] = 'public; max-age=600'
      send_file Rails.root.join("tmp/uploads/#{params[:path]}"), :disposition => 'inline'
  end
end