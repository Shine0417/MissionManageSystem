# require 'rails_helper'

# RSpec.describe MissionsController, type: :controller dozzz
#   let!(:mission1) { Mission.create(title: 'test title 1', description: 'Hello World 1') }

#   it '#index' do
#     mission2 = Mission.create(title: 'test title 2', description: 'Hello World 2')
#     get :index
#     expect(response).to have_http_status(200)
#     expect(response).to render_template(:index)
#     expect(assigns(:missions)).to eq([mission1, mission2])
#   end

#   it '#new' do
#     get :new
#     expect(response).to have_http_status(200)
#     expect(response).to render_template(:new)
#   end

#   it '#edit a mission' do
#     get :edit, params: { id: mission1[:id] }
#     expect(response).to have_http_status(200)
#     expect(response).to render_template(:edit)
#   end

#   describe '#create' do
#     let(:mission_params) { { mission: { title: 'title', description: 'content' } } }

#     it 'creates mission' do
#       expect { post :create, params: mission_params }.to change { Mission.all.size }.by(1)
#     end

#     it 'redirects to Home after success' do
#       post :create, params: mission_params
#       expect(response).to have_http_status(302)
#       expect(response).to redirect_to((missions_path))
#     end

#     it 'render :new when error occurs' do
#       # stub
#       allow_any_instance_of(Mission).to receive(:save).and_return(false)
#       post :create, params: mission_params
#       expect(response).not_to have_http_status(302)
#       expect(response).to render_template(:new)
#     end
#   end

#   describe '#update' do
#     let(:update_params) { { title: 'updated title', description: 'updated content' } }

#     it 'updates mission' do
#       post :update, params: { mission: update_params, id: mission1[:id] }
#       mission1.reload

#       expect(mission1[:title]).to eq(update_params[:title])
#     end

#     it 'redirects to show after success' do
#       post :update, params: { mission: update_params, id: mission1[:id] }

#       expect(response).to have_http_status(302)
#       expect(response).to redirect_to(mission_path(Mission.find(mission1[:id])))
#     end

#     it 'render :new when invalid param' do
#       # stub
#       allow_any_instance_of(Mission).to receive(:update).and_return(false)
#       post :update,
#            params: { mission: update_params, id: mission1[:id] }

#       expect(response).not_to have_http_status(302)
#       expect(response).to render_template(:edit)
#     end
#   end

#   describe '#destroy' do
#     it 'deletes a mission' do
#       expect { delete :destroy, params: { id: mission1[:id] } }.to change { Mission.all.size }.by(-1)
#       expect(response).to have_http_status(302)
#     end
#   end
# end
