module Uploadable
  def upload_file(file_name)
    uploaded_io = file_name
    File.open(Rails.root.join('public', 'uploads',
      uploaded_io.original_filename), 'w') do |file|
        file.write(uploaded_io.read)
      end
    return true
  end
end