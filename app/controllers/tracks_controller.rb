class TracksController < ApplicationController
  before_action :authorize
  def index
    @tracks = Track.all
  end

  def show
    @track = Track.find(params[:id])
  end
end
