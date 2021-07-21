require 'rails_helper'

RSpec.describe "Api::V1::Classrooms", type: :request do

    let!(:board) {create(:board)}
    let!(:classroom) {create_list(:classroom, 10, board_id: board.id)}
    let!(:classroom_id){ classroom.first.id }
    let!(:subject) {create(:subject, classroom_id: classroom_id)}
    let!(:user) { create(:user, board_id: board.id, classroom_id: classroom_id) }
    let!(:headers){valid_headers}


  describe "GET /index" do
    before {get "/api/v1/boards/#{board.id}/classrooms", params: {}, headers: headers}

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
