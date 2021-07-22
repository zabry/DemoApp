require 'rails_helper'

RSpec.describe "Api::V1::Reposoitories", type: :request do

    let!(:board) {create(:board)}
    let!(:classroom) {create(:classroom, board_id: board.id)}
    let!(:subject) {create(:subject, classroom_id: classroom.id)}
    let!(:chapter) {create(:chapter, subject_id: subject.id)}
    let!(:reposoitory) {create(:reposoitory, chapter_id: chapter.id)}
    let!(:user) { create(:user, board_id: board.id, classroom_id: classroom.id) }
    let!(:user_repo_progress) {create(:user_repo_progress, user_id: user.id, reposoitory_id: reposoitory.id)}

  describe "GET /index" do
    before {get "/api/v1/chapters/#{chapter.id}/reposoitories", params: {}, headers: headers}

    it 'returns the boards' do
      expect(JSON.parse(response.body)).not_to be_empty
      ##puts JSON.parse(response.body)
    end
    
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /Start a lecture from repositories" do

    let(:valid_attributes) { { reposoitory_id: reposoitory.id } }
    let!(:headers){valid_headers}    
    
    before {post "/api/v1/chapters/#{chapter.id}/reposoitories", params: valid_attributes, headers: headers}

    it 'creates  record' do
      created_record = UserRepoProgress.find_by(user_id: user.id, reposoitory_id: reposoitory.id)
      expect(created_record.progress).to match(0.0)
    end
    
    it 'returns status code 201' do
      expect(response).to have_http_status(201)
    end
  end



  describe "PUT /Complete/Pause a lecture from repositories" do

    let(:valid_attributes) { { progress: "1.5"} }
    let(:invalid_attributes) { { progress: "Some Random String"} }
    let!(:headers){valid_headers}
    
    context 'valid attributes' do
    before { put "/api/v1/chapters/#{chapter.id}/reposoitories/#{reposoitory.id}", params: valid_attributes, headers: headers}

    it 'updates record' do
      new_record = UserRepoProgress.find_by(user_id: user.id, reposoitory_id: reposoitory.id)
      expect(new_record.progress).to match(1.5)

    end
    
        it 'returns status code 201' do
            expect(response).to have_http_status(200)
        end
      end

       context 'invalid parameters sent' do

        before { put "/api/v1/chapters/#{chapter.id}/reposoitories/#{reposoitory.id}", params: invalid_attributes, headers: headers}

          it 'does not update record' do
              new_record = UserRepoProgress.find_by(user_id: user.id, reposoitory_id: reposoitory.id)
              ##puts new_record
              expect(new_record.progress).to match(0.0)

            end
        end
      
  
  end


end
