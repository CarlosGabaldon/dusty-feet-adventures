require 'rails_helper'

RSpec.describe Uploadable do
  it 'has upload_file' do
    controller = Object.new.extend(Uploadable)
    upload_path = "#{Rails.root}/public/uploads/trail_gpx.xml"
    file_path = "#{Rails.root}/spec/fixtures/trail_gpx.xml"
    file = File.new(file_path)
    uploaded_file = ActionDispatch::Http::UploadedFile.new(
      tempfile: file,
      filename: File.basename(file),
      content_type: "text/xml")
    expect(controller.upload_file(uploaded_file)).to eq upload_path
  end
end
