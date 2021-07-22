require 'rails_helper'

RSpec.describe "TestModules", type: :request do

    let!(:board) {create(:board)}
    let!(:classroom) {create(:classroom, board_id: board.id)}
    let!(:subject) {create(:subject, classroom_id: classroom.id)}
    let!(:chapter) {create(:chapter, subject_id: subject.id)}
    let!(:user) { create(:user, board_id: board.id, classroom_id: classroom.id) }
    let!(:test_module) { create_list(:test_module, 10, chapter_id: chapter.id) }
    let!(:headers){valid_headers}

    ##let!(:test_question) { create(:test_question, test_module_id: test_module.id) }
  describe "GET /index" do
    
    before {get "/api/v1/chapters/#{chapter.id}/test_modules", params: {}, headers: headers}

    it 'returns the boards' do
      expect(JSON.parse(response.body)).not_to be_empty
      ##puts JSON.parse(response.body)
    end
    
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  
  end
  
end
