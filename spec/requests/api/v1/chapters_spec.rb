require 'rails_helper'

RSpec.describe "Api::V1::Chapters", type: :request do
    let!(:board) {create(:board)}
    let!(:classroom) {create(:classroom, board_id: board.id)}
    let!(:subject) {create(:subject, classroom_id: classroom.id)}
    let!(:chapter) {create_list(:chapter, 20, subject_id: subject.id)}
    let!(:chapter_id){chapter.first.id}
    let!(:reposoitory) {create(:reposoitory, chapter_id: chapter_id)}
    let!(:user) { create(:user, board_id: board.id, classroom_id: classroom.id) }
    let!(:test_module) { create(:test_module, chapter_id: chapter_id) }
    let!(:headers){valid_headers}
    ##let!(:test_question) { create(:test_question, test_module_id: test_module.id) }
    ##let!(:attempt) { create(:attempt, test_module_id: test_module.id, user_id: user.id) }
    ##let!(:attempt_answer) { create(:attempt_answer, attempt_id: attempt.id, test_question_id: test_question.id) }    
    ##let!(:user) { create(:user, board_id: board_id)}
  
  describe "GET /index" do

    before {get "/api/v1/subjects/#{subject.id}/chapters", params: {}, headers: headers}

    it 'returns the boards' do
      expect(JSON.parse(response.body)).not_to be_empty
      ##puts JSON.parse(response.body)
    end
    
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
    
  end

end
