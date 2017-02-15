class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  process convert: 'jpg'

  process :resize_to_fill => [400, 300]

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def filename
    "#{Time.now.strftime('%Y%m%d%H%M%S')}.jpg" if original_filename.present?
  end

end
