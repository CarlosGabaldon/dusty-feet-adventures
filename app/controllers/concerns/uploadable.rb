# Concern to support uploading files to the ./public/uploads/
# Useage:
#   Mixin to controller with:
#     include Uploadable
#   Use in controller with:
#     @trail.gpx_file_path = upload_file(params[:gpx_file])
module Uploadable
  def upload_file(file_name)
    path = ''
    File.open(upload_path(file_name), 'w') do |file|
      file.write(file_name.read)
      path = file.path
    end
    path
  end

  private

  def upload_path(file_name)
    Rails.root.join('public', 'uploads', file_name.original_filename)
  end
end
