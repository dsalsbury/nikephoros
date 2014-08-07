require 'fog/aws/storage'
require 'carrierwave'

class PdfUploader < CarrierWave::Uploader::Base
  storage :fog
  
  def move_to_cache
    true
  end
  
  def move_to_store
    true
  end

  def store_dir
  end

  def extension_white_list
    ['pdf']
  end
end
