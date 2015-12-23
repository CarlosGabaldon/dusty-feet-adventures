# Concern to support uploading files to the ./public/uploads/
# Useage:
#   Mixin to controller with:
#     include Uploadable
#   Use in controller with:
#     @trail.gpx_file_path = upload_file(params[:gpx_file])
module Uploadable
  def upload_file(file_name)
    uploaded_io = file_name
    path = ""
    File.open(Rails.root.join('public', 'uploads',
      uploaded_io.original_filename), 'w') do |file|
        file.write(uploaded_io.read)
        path = file.path
      end
    return path
  end
end
