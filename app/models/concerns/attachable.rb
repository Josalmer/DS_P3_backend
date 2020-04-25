# frozen_string_literal: true

module Attachable
  extend ActiveSupport::Concern

  included do
    has_one_attached :attached_file
  end

  def save_resized_image(base64_file)
    image = check_if_is_image(base64_file)
    if image
      image = resize_image(image)
      save_image(image)
      true
    else
      false
    end
  end

  def file_url
    attached_file&.attachment && Rails.application.routes.url_helpers.url_for(attached_file)
  end

  def file_name
    attached_file&.attachment && attached_file&.filename&.to_s
  end

  def default_image
    ActionController::Base.helpers.image_url('category.png')
  end

  def resize_image(image)
    h = image.height
    w = image.width
    crop_image(h, w, image) unless h == w
    image.resize('224x224')
  end

  def crop_image(height, width, image)
    crop_value = [height, width].min
    off_height = [(height - crop_value) / 2, 0].max
    off_width = [(width - crop_value) / 2, 0].max
    crop_param = "#{crop_value}x#{crop_value}+#{off_width}+#{off_height}"
    image.crop(crop_param)
  end

  def check_if_is_image(base64_file)
    return unless base64_file[%r{(image/[a-z]{3,4})}].present?

    content_type = base64_file[%r{(image/[a-z]{3,4})|(application/[a-z]{3,4})}]
    content_type[%r{\b(?!.*/).*}]
    contents = base64_file.sub %r{data:((image|application)/.{3,}),}, ''
    decoded_data = Base64.decode64(contents)
    MiniMagick::Image.read(decoded_data)
  end

  def save_image(image)
    attached_file.purge
    content_type = image.type
    filename ||= 'file_' + Time.zone.now.to_s + '.' + content_type
    file_full_path = "#{Rails.root}/tmp/#{filename}"
    image.write(file_full_path)
    attached_file.attach(io: File.open(file_full_path), filename: filename)
    FileUtils.rm(file_full_path)
  end
end
