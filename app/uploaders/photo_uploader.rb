# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  version :standard do
    resize_to_fit 800, 600
  end

  version :index_photo do
    cloudinary_transformation radius: 20,
      width: 200, height: 200, crop: :thumb
  end

  version :show_photo do
    cloudinary_transformation width: 300, height: 300, crop: :thumb
  end

end
