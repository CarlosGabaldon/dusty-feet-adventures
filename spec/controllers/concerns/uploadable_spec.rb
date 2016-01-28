require 'rails_helper'

RSpec.describe Uploadable do
  let(:controller){ Object.new.extend(Uploadable) }
  let(:upload_path){ "#{Rails.root}/public/uploads/trail_gpx.xml" }
  let(:file_path){ "#{Rails.root}/spec/fixtures/trail_gpx.xml" }
  let(:file){ File.new(file_path) }

  it 'has #upload_file' do
    uploaded_file = ActionDispatch::Http::UploadedFile.new(
      tempfile: file,
      filename: File.basename(file),
      content_type: "text/xml")
    expect(controller.upload_file(uploaded_file)).to eq upload_path
  end
end
