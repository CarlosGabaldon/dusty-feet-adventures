require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  let(:trail) {create(:trail_with_tag_names)}

  describe "DELETE #remove" do
    it "returns http success" do
      expect{
        delete :remove, params: { trail_id: trail, id: trail.tags.first.id }
      }.to change(trail.tags, :count).by(-1)

      expect(response).to have_http_status(:success)
    end
  end

end
