require 'rails_helper'

RSpec.describe TrailsController, type: :controller do
  let(:user) {create(:user)}

  before do
    allow(controller).to receive(:authenticate_user!)
    allow(controller).to receive(:current_user).and_return(user)
  end

  context "non-admin users" do
    it "are not allowed to access new action" do
      get :new

      expect(response).to redirect_to "/"
      expect(flash[:alert]).to eq "You must be an admistrator to access."
    end
  end

end
