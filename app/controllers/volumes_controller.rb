class VolumesController < ApplicationController
  respond_to :html

  def index
    @volumes = Volume.order('number DESC').decorate
  end
end
