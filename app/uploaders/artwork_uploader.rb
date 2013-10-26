# encoding: utf-8

class ArtworkUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  storage :fog

  include CarrierWave::MimeTypes
  process :set_content_type
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Create different versions of your uploaded files:
  version :artwork do
    process :resize_to_limit => [100, 100]
  end

  def extension_white_list
    %w(jpg jpeg gif png ai eps psd pdf)
  end
end