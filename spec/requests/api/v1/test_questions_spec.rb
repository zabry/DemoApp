require 'rails_helper'

RSpec.describe "TestQuestions", type: :request do

  let!(:board) {create(:board)}
  let!(:classroom) {create(:classroom, board_id: board.id)}
  let!(:subject) {create(:subject, classroom_id: classroom.id)}
  let!(:chapter) {create(:chapter, subject_id: subject.id)}
  let!(:user) { create(:user, board_id: board.id, classroom_id: classroom.id) }
  let!(:test_module) { create(:test_module, chapter_id: chapter.id) }
  let!(:headers){valid_headers}

  let!(:test_question) { create_list(:test_question, 10, test_module_id: test_module.id) }
  describe "GET /index" do
    before {get "/api/v1/test_modules/#{test_module.id}/test_questions", params: {}, headers: headers}

    it 'returns the boards' do
      expect(JSON.parse(response.body)).not_to be_empty
      ##puts JSON.parse(response.body)
    end
    
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  
  end

  def valid_headers
    {
      "token" => "f57440dadcba99db0498"
    }
  end
end
