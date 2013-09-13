class VolumesController < ApplicationController
  respond_to :html

  def index
    @volumes = Volume.sort_by_number_desc.decorate
  end
end
