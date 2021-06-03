require 'rails_helper'

RSpec.describe MissionsController, type: :controller do
  before(:all) do
    @mission1 = Mission.create(title: 'test title 1', description: 'Hello World')
    @mission2 = Mission.create(title: 'test title 2', description: 'Hello World')
  end

  it '#index' do
    get :index
    expect(response).to have_http_status(200)
    expect(response).to render_template(:index)
  end

  it '#new' do
    get :new
    expect(response).to have_http_status(200)
    expect(response).to render_template(:new)
  end

  it '#edit a mission' do
    # before action creates objects with id: nil so use this instead
    @mission3 = Mission.create(title: 'test title 3', description: 'Hello World')

    get :edit, params: { id: @mission3[:id] }
    expect(response).to have_http_status(200)
    expect(response).to render_template(:edit)
  end

  describe '#create' do
    before(:all) do
      @mission_params = { mission: { title: 'title', description: 'content' } }
    end

    it 'creates mission' do
      expect { post :create, params: @mission_params }.to change { Mission.all.size }.by(1)
    end

    it 'redirects to Home after success' do
      post :create, params: @mission_params
      expect(response).to have_http_status(302)
      expect(response).to redirect_to((missions_path))
    end

    it 'render :new when error occurs' do
      # stub
      allow_any_instance_of(Mission).to receive(:save).and_return(false)
      post :create, params: @mission_params
      expect(response).not_to have_http_status(302)
      expect(response).to render_template(:new)
    end
  end

  describe '#update' do
    xit 'updates mission' do
      # before action creates objects with id: nil so use this instead
      mission5 = Mission.create(title: 'test title 5', description: 'Hello World')
      post :update,
           params: { mission: { title: 'updated title', description: 'updated description' }, id: mission5[:id] }

      expect(page).to have_css('updated title')
      expect(page).to have_css('updated description')
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(mission_path(Mission.find(mission5[:id])))
    end

    xit 'render :new when error occurs' do
      # stub
      allow_any_instance_of(Mission).to receive(:update).and_return(false)
      mission5 = Mission.create(title: 'test title 5', description: 'Hello World')
      post :update,
           params: { mission: { title: 'updated title', description: 'updated description' }, id: mission5[:id] }

      expect(response).not_to have_http_status(302)
      expect(response).to render_template(:edit)
    end
  end
  # describe '#destroy' do
  #   before(:all) do
  #     @mission6 = Mission.create(title: 'test title 6', description: 'Hello World')
  #     @mission7 = Mission.create(title: 'test title 7', description: 'Hello World')
  #   end

  #   it 'deletes a mission' do
  #     expect { delete :destroy, params: { id: @mission6[:id] } }.to change { Mission.all.size }.by(-1)
  #   end

  #   it 'redirect_to index after delete' do
  #     delete :destroy, params: { id: @mission7[:id] }

  #     expect(response).not_to have_http_status(302)
  #     expect(response).to redirect_to(:index)
  #   end
  # end
end
