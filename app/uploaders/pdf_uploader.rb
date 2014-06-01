class PdfUploader < CarrierWave::Uploader::Base
  storage :file
  # storage :fog

  def store_dir
    "system/pdfs/#{model.id}"
  end

  def extension_white_list
    ['pdf']
  end
end
