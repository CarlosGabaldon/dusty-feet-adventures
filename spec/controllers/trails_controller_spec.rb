require 'rails_helper'

RSpec.describe TrailsController, type: :controller do
  let(:user) {create(:user)}

  before do
    allow(controller).to receive(:authenticate_user!)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'GET index' do
    it 'assigns @trails' do
      trails = Trail.all
      get :index
      expect(assigns(:trails)).to eq trails
      expect(response).to render_template('index')
    end
  end

  describe 'GET show' do
    it 'assigns @trail' do
      trail = create(:trail)
      get :show, params: {id: trail.id }
      expect(assigns(:trail)).to eq trail
      expect(response).to render_template('show')
    end
  end

  context 'non-admin users' do
    describe 'GET new' do
      it 'are not allowed to access new action' do
        get :new

        expect(response).to redirect_to '/'
        expect(flash[:alert]).to eq 'You must be an admistrator to access.'
      end
    end
  end

  context "admin-users" do
    before do
      user = create(:user, admin: true)
      allow(controller).to receive(:authenticate_user!)
      allow(controller).to receive(:current_user).and_return(user)
    end

    describe 'GET new' do
      it 'assigns @trail' do
        get :new

        expect(assigns(:trail))
        expect(response).to render_template('new')
      end
    end

    describe 'GET edit' do
      it 'assigns @trail' do
        trail = create(:trail)
        get :edit, params: {id: trail.id }

        expect(assigns(:trail)).to eq trail
        expect(response).to render_template('edit')
      end
    end

    describe 'POST create' do
      it 'assigns @trail' do
        post :create, params: { trail: { name: 'JMT', description: 'Trail'} }

        expect(assigns(:trail).name).to eq 'JMT'
        expect(response).to redirect_to trail_path(assigns(:trail).id)
      end

      it 'renders new template for failure' do
        post :create, params: { trail: { name: 'JMT'} }
        expect(response).to render_template('new')
      end
    end

    describe 'PATCH update' do
      it 'assigns @trail' do
        trail = create(:trail)
        patch :update, params: { id: trail.id, trail: { name: 'Trail updated' } }

        expect(assigns(:trail).name).to eq 'Trail updated'
        expect(response).to redirect_to trail_path(assigns(:trail).id)
      end

      it 'renders edit template for failure' do
        trail = create(:trail)
        patch :update, params: { id: trail.id, trail: { name: ' ' } }
        expect(response).to render_template('edit')
      end
    end

    describe 'DELETE destroy' do
      it 'destroys @trail' do
        trail = create(:trail)
        expect{
          delete :destroy, params: { id: trail }
        }.to change(Trail, :count).by(-1)

        expect(response).to redirect_to trails_path
      end
    end
  end
end
