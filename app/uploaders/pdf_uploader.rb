require 'fog/aws/storage'
require 'carrierwave'

class PdfUploader < CarrierWave::Uploader::Base
  storage :fog

  def store_dir
  end

  def extension_white_list
    ['pdf']
  end
end
